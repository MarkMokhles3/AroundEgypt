//
//  ExperienceCell.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 06/09/2025.
//


import SwiftUI
import SDWebImageSwiftUI

struct ExperienceCell: View {
    
    var experience: ExperienceData
    @State private var isLiked = false
    @State private var showDetail = false
    
    var body: some View {
        VStack(spacing: 10) {
            // Card
            ZStack {
                // Image
                WebImage(url: URL(string: experience.coverPhoto ?? ""))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 155)
                    .cornerRadius(8)
                    .overlay(
                        ProgressView()
                            .opacity(experience.coverPhoto == nil ? 1 : 0)
                    )
                
                // Center 360 badge
                Image("360Icon")
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(height: 155)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Recommended Badge
                if experience.recommended == 1 {
                    RecommendedView()
                }
                
                // Info button
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            print("Info tapped")
                        }) {
                            Image(systemName: "info.circle")
                                .font(.system(size: 18))
                                .padding(0)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        }
                        .padding(.top, 10)
                        .padding(.trailing, 10)
                    } //: HSTACK
                    Spacer()
                } //: VSTACK
                
                // Views + Gallery icon
                ViewsGalleryView(views: "\(experience.viewsNo ?? 0)")
                
            } //: ZSTACK
            .frame(height: 155) //>>>>>>> This line
            
            // Title + Likes
            HStack {
                Text(experience.title ?? "")
                    .font(.custom("Arial", size: 14).weight(.bold))
                
                Spacer()
                
                HStack(spacing: 8) {
                    Text("\(experience.likesNo ?? 0)")
                        .font(.custom("Arial", size: 14).weight(.bold))
                    Image("unfilledHeartIcon")
                }
            } //: HSTACK
        } //: VSTACK
        .padding(.horizontal, 15)
        .onTapGesture {
            showDetail = true
        }
        // Present modally
        .sheet(isPresented: $showDetail) {
            ExperienceDetailsView(id: experience.id ?? "",
                                  detailsResults: experience)
        }
    }
}

struct ExperienceCell_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            ExperienceCell(experience: MockData.Experiences[0])
            ExperienceCell(experience: MockData.Experiences[1])
            ExperienceCell(experience: MockData.Experiences[2])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
