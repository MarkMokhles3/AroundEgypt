//
//  AroundEgyptTests.swift
//  AroundEgyptTests
//
//  Created by Mark Mokhles on 06/09/2025.
//

import XCTest
@testable import AroundEgypt

final class AroundEgyptTests: XCTestCase {
    var viewModel: ExperiencesListViewModel!
    var mockAPI: MockAPIService!
    
    override func setUp() {
        super.setUp()
        mockAPI = MockAPIService()
        viewModel = ExperiencesListViewModel(api: mockAPI) // inject here
        
        // remove cache files that might interfere
            CacheManager.shared.clearCache(filename: "mostRecentExperiences.json")
            CacheManager.shared.clearCache(filename: "recommendedExperiences.json")
    }
    
    override func tearDown() {
        viewModel = nil
        mockAPI = nil
        super.tearDown()
    }
    
    
    func testGetMostRecentExperiences_Success() {
        // Given
        mockAPI.shouldReturnError = false
        let exp = expectation(description: "Fetch success")
        
        // When
        viewModel.getMostRecentExperiences {
            exp.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 1.0)
        XCTAssertFalse(self.viewModel.mostRecentExperiences.isEmpty)
        XCTAssertNil(self.viewModel.alertItem)
    }
    
    // TestGetRecommendedExperiences
    func testGetRecommendedExperiences_Success() {
        // Given
        mockAPI.shouldReturnError = false
        let exp = expectation(description: "Fetch recommended")
        
        // When
        viewModel.getRecommendedExperiences {
            exp.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 2.0)
        XCTAssertFalse(self.viewModel.recommendedExperiences.isEmpty)
        XCTAssertEqual(self.viewModel.recommendedExperiences.first?.title, "Temple of Isis (Philae)")
        XCTAssertNil(self.viewModel.alertItem)
    }
    
    // TestGetRecommendedExperiences_Failure
    func testGetRecommendedExperiences_Failure() {
        // Given
        mockAPI.shouldReturnError = true
        let exp = expectation(description: "Fail recommended")
        
        // When
        viewModel.getRecommendedExperiences {
            exp.fulfill()
        }
        
        // Then
        waitForExpectations(timeout: 2.0)
        XCTAssertTrue(self.viewModel.recommendedExperiences.isEmpty)
        XCTAssertNotNil(self.viewModel.alertItem)
        XCTAssertEqual(self.viewModel.alertItem?.title, AlertContext.unableToComplete.title)
    }
    
    //  Search test
    func testSearchExperiences_Success() {
        mockAPI.shouldReturnError = false
        
        let exp = expectation(description: "Search success")
        viewModel.searchForExperiences(query: "Mock") {
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 1.0)
        XCTAssertFalse(self.viewModel.searchResults.isEmpty)
    }

}


