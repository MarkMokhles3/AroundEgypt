//
//  MockAPIService.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 09/09/2025.
//

import XCTest
@testable import AroundEgypt

class MockAPIService: APIServiceProtocol {
    var shouldReturnError = false
    
    func getRecommendedExperiences(recommended: Bool, completion: @escaping (Result<Experiences, APError>) -> Void) {
        if shouldReturnError {
            completion(.failure(.unableToComplete))
        } else {
            let mockData = Experiences(data: MockData.Experiences)
            completion(.success(mockData))
        }
    }
    
    func getMostRecentExperiences(completion: @escaping (Result<Experiences, APError>) -> Void) {
        if shouldReturnError {
            completion(.failure(.unableToComplete))
        } else {
            let mockData = Experiences(data: MockData.Experiences)
            completion(.success(mockData))
        }
    }
    
    func getExperienceDetails(id: String, completion: @escaping (Result<ExperienceDetails, APError>) -> Void) {
        // Not needed for now
        completion(.failure(.invalidData))
    }
    
    func postLikeExperience(id: Int, completion: @escaping (Result<ExperienceData, APError>) -> Void) {
        completion(.failure(.invalidData))
    }
    
    func searchForExperiences(query: String, completion: @escaping (Result<Experiences, APError>) -> Void) {
        if query.isEmpty {
            completion(.success(Experiences(data: [])))
        } else {
            let mockData = Experiences(data: MockData.Experiences)
            completion(.success(mockData))
        }
    }
}
