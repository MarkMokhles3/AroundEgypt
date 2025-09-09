//
//  LoadingView.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 08/09/2025.
//


import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image("aroundEgyptImage")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            // Loading indicator 
            VStack(spacing: 16) {
                Spacer()
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.5)
                    .padding(.bottom, 50)
            }
        } //: ZSTACK
    }
}


struct LoadingView_Previews: PreviewProvider {
  static var previews: some View {
      LoadingView()
          .padding()
  }
}
