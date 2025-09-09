//
//  ViewsGalleryView.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 06/09/2025.
//


import SwiftUI

struct ViewsGalleryView: View {
    
    let views: String
    
    var body: some View {

        VStack {
            Spacer()
            
            // Views
            HStack {
                HStack(spacing: 5) {
                    Image("eyeIcon")
                        .foregroundColor(.blue)
                    
                    Text(views)
                        .font(.custom("Arial", size: 14).weight(.bold))
                        .foregroundColor(.white)
                } //: HSTACK
                .padding(.leading, 10)
                
                Spacer()
                
                // Gallery icon
                Image("galleryIcon")
                    .foregroundColor(.white)
                    .padding(.trailing, 10)
            } //: HSTACK
            .padding(.bottom, 10)
        } //: VSTACK
    }
}
