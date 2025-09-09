//
//  ExperienceDetailsCell.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 07/09/2025.
//


import SwiftUI
import SDWebImageSwiftUI

struct ExperienceDetailsCell: View {
    
    var ExperienceDetailsResult: ExperienceData
    @State private var webViewHeight: CGFloat = .zero
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ZStack {
                    
                    // Image
                    GeometryReader { geo in
                            WebImage(url: URL(string: ExperienceDetailsResult.coverPhoto ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width, height: 250)
                                .clipped()
                        }
                        .frame(height: 250) // lock GeometryReader height

                    
                    // Views + Gallery icon
                    ViewsGalleryView(views: "\(ExperienceDetailsResult.viewsNo ?? 0) views")
                } //: ZSTACK
                
                // Title + Likes + City + Description
                VStack(alignment: .leading, spacing: 10) {
                    // Title + Likes
                    HStack {
                        Text(ExperienceDetailsResult.title ?? "")
                            .font(.custom("Arial", size: 16).weight(.bold))
                        
                        Spacer()
                        
                        HStack(spacing: 10) {
                            Image("shareIcon")
                            Image("unfilledHeartIcon")
                                .foregroundColor(.orange)
                            Text("\(ExperienceDetailsResult.likesNo ?? 0)")
                                .font(.custom("Arial", size: 16).weight(.medium))
                        }
                    } //: HSTACK
                    
                    // City
                    Text(ExperienceDetailsResult.city?.name ?? "")
                        .font(.custom("Arial", size: 16).weight(.medium))
                        .foregroundColor(.gray)
                    
                    // Separator
                    Divider()
                        .padding(.vertical, 5)
                    
                    // Description Title
                    Text("Description")
                        .font(.custom("Arial", size: 22).weight(.bold))
                    
                    // Description Body
                    Text(ExperienceDetailsResult.description ?? "")
                        .font(.custom("Arial", size: 14).weight(.medium))
                        .foregroundColor(.primary)
                } //: VSTACK
                .padding(.horizontal, 15)
            } //: VSTACK
        }
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.layoutDirection, .leftToRight)
    }
}


struct ExperienceDetailsCell_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetailsCell(ExperienceDetailsResult: MockData.philaeTemple)
    }
}
