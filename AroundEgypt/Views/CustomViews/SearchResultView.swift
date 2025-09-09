//
//  SearchResultView.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 07/09/2025.
//


import SwiftUI

struct SearchResultView: View {
    
    @ObservedObject var viewModel: ExperiencesListViewModel
    
    var body: some View {
        
        // Blank search results screen
        ScrollView {
            if viewModel.searchResults.isEmpty {
                Text("No results found")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top, 40)
            } else {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.searchResults, id: \.id) { item in
                        ExperienceCell(experience: item)
                            .frame(height: 200)
                            .cornerRadius(12)
                            .padding(.horizontal, 3)
                    }
                }
                .padding(.vertical, 10)
            }
        }
    }
}
