//
//  RecommendedView.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 06/09/2025.
//


import SwiftUI

struct RecommendedView: View {
    var body: some View {
        VStack {
            HStack {
                HStack(spacing: 5) {
                    Image("favoriteIcon")
                    
                    Text("Recommended")
                        .font(.custom("Arial", size: 12).weight(.bold))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.black.opacity(0.3))
                .cornerRadius(20)
                .padding(.leading, 10)
                .padding(.top, 10)
                
                Spacer()
            }
            Spacer()
        }
    }
}

struct RecommendedView_Previews: PreviewProvider {
  static var previews: some View {
      RecommendedView()
          .padding()
  }
}
