//
//  ExperiencesListView.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 06/09/2025.
//


import SwiftUI

struct ExperiencesListView: View {
    
    @State private var isSearching = false
    @ObservedObject var network = NetworkMonitor.shared
    @StateObject private var viewModel = ExperiencesListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    VStack(spacing: 0) {
                        
                        // MARK: - Search Bar
                        HStack(spacing: 12) {
                            // Side Menu
                            Button(action: {
                                // Handle side menu tap
                            }) {
                                Image(systemName: "line.horizontal.3")
                                    .font(.system(size: 20))
                                    .foregroundColor(.primary)
                            }
                            
                            // Search Field
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.gray)
                                
                                TextField("Try \"Luxor\"", text: $viewModel.searchText, onEditingChanged: { editing in
                                    withAnimation {
                                        isSearching = editing
                                    }
                                })
                                .textFieldStyle(PlainTextFieldStyle())
                                .accessibilityIdentifier("SearchTextField")
                                
                                .onChange(of: viewModel.searchText) { searchText in
                                    if network.isConnected {
                                        viewModel.searchForExperiences(query: searchText)
                                    } else {
                                        viewModel.searchFor(query: searchText) // search locally
                                    }
                                }
                                
                                if !viewModel.searchText.isEmpty {
                                    Button(action: {
                                        viewModel.searchText = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                    }
                                }
                            } //: HSTACK
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            
                            // Cancel
                            if isSearching {
                                Button("Cancel") {
                                    withAnimation {
                                        isSearching = false
                                        viewModel.searchText = ""
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                                }
                                .foregroundColor(.primary)
                            }
                            
                            // Filter
                            Button(action: {
                                // Handle filter tap
                            }) {
                                Image("filterIcon")
                                    .font(.system(size: 20))
                                    .foregroundColor(.primary)
                            }
                        } //: HSTACK
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        // MARK: - Conditional Content
                        if viewModel.searchText.isEmpty {
                            HomeContentView(viewModel: viewModel)
                        } else {
                            SearchResultView(viewModel: viewModel)
                        }
                    } //: VSTACK
                    .navigationBarTitleDisplayMode(.inline)
                    .refreshable {
                        await viewModel.refreshData()
                    }
                }
            } //: ZSTACK
        }
        .onAppear {
            viewModel.loadAllData()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct DetailView: View {
    var details: String
    var body: some View {
        Text(details)
            .font(.body)
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .padding(.all, 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExperiencesListView()
    }
}

