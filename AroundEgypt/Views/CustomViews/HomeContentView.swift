//
//  HomeContentView.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 06/09/2025.
//


import SwiftUI

struct HomeContentView: View {
    
    @ObservedObject var viewModel: ExperiencesListViewModel
    
    var body: some View {
        
        // Home content
        VStack(alignment: .leading, spacing: 0) {
            
            Spacer()
            
            // Welcome Section
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome!")
                    .font(.custom("Arial", size: 22).weight(.heavy))
                Text("Now you can explore any experience in 360 degrees and get all the details about it all in one place.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            Spacer()
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    
                    // Recommended
                    Text("Recommended Experiences")
                        .font(.custom("Arial", size: 22).weight(.heavy))
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach(viewModel.recommendedExperiences, id: \.id) { item in
                                ExperienceCell(experience: item)
                                    .frame(width: UIScreen.main.bounds.width - 5, height: 200)
                                    .cornerRadius(12)
                            }
                        }
                    }
                    
                    // Most Recent
                    Text("Most Recent")
                        .font(.custom("Arial", size: 22).weight(.heavy))
                        .padding(.horizontal, 16)
                    
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.mostRecentExperiences, id: \.id) { item in
                            ExperienceCell(experience: item)
                                .frame(height: 200)
                                .cornerRadius(12)
                                .padding(.horizontal, 3)
                        }
                    }
                }
                .padding(.vertical, 10)
            }
        }
    }
}

//struct HomeContentView_Previews: PreviewProvider {
//  static var previews: some View {
//      HomeContentView(viewModel: ExperiencesListViewModel())
//          .padding()
//  }
//}
