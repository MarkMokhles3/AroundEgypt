//
//  ExperienceDetailsView.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 07/09/2025.
//


import SwiftUI

struct ExperienceDetailsView: View {
    
    var id: String
    var detailsResults: ExperienceData?
    @StateObject private var  viewModel = ExperienceDetailsViewModel()
    
    var body: some View {
        ExperienceDetailsCell(ExperienceDetailsResult: ((viewModel.detailsResults == nil ? detailsResults : viewModel.detailsResults) ?? ExperienceData()) )
        
        // onAppear
            .onAppear {
                viewModel.getExperienceDetails(id: id)
            }
        
        // Alert
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
    }
}


struct ExperienceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceDetailsView(id:"7f209d18-36a1-44d5-a0ed-b7eddfad48d6")
    }
}
