//
//  ExperienceDetailsViewModel.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 07/09/2025.
//

import Foundation

final class ExperienceDetailsViewModel: ObservableObject {
    
    @Published var alertItem: AlertItem?
    @Published var detailsResults: ExperienceData?
    
    func getExperienceDetails(id: String) {
        APIService.shared.getExperienceDetails(id: id) { [self] result in
            DispatchQueue.main.async { [self] in
                print(result)
                switch result {
                case .success(let experiencDetails):
                    self.detailsResults = experiencDetails.data
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        return
//                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
