//
//  ExperiencesListViewModel.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 06/09/2025.
//


import Foundation
import SDWebImage

final class ExperiencesListViewModel: ObservableObject  {
    
    // MARK: - Published
    @Published var mostRecentExperiencesCached: Experiences?
    @Published var recommendedExperiencesCached: Experiences?

    @Published var mostRecentExperiences = [ExperienceData]()
    @Published var recommendedExperiences = [ExperienceData]()
    @Published var resultsWithoutFilteration = [ExperienceData]()
    @Published var searchResults: [ExperienceData] = []
    @Published var searchText = ""
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    // MARK: - Private let
    private let cacheMostRecentFileName = "mostRecentExperiences.json"
    private let cacheRecommendedExperiencesFileName = "recommendedExperiences.json"
    
    private let api: APIServiceProtocol
    
    // MARK: - init
    init(api: APIServiceProtocol = APIService.shared) {
            self.api = api
        }
    
    // MARK: - iFunctions
    func getMostRecentExperiences(completion: (() -> Void)? = nil) {
        api.getMostRecentExperiences() { [weak self] result in
            DispatchQueue.main.async { [self] in
                guard let self = self else { return }
                
                switch result {
                case .success(let experiences):
                    self.mostRecentExperiencesCached = experiences
                    self.mostRecentExperiences = experiences.data ?? []
                    self.resultsWithoutFilteration = experiences.data ?? []
                    
                    // Save to cache
                    CacheManager.shared.saveData(experiences, filename: self.cacheMostRecentFileName)
                    
                    // Preload images for caching
                    self.preloadImages(from: self.mostRecentExperiences)
                    
                case .failure(let error):
                    
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        // self.alertItem = AlertContext.unableToComplete
                        
                        // Load from cache if API fails
                        if let cachedExperiences: Experiences = CacheManager.shared.loadData(self.cacheMostRecentFileName, type: Experiences.self) {
                            self.mostRecentExperiencesCached = cachedExperiences
                            self.mostRecentExperiences = cachedExperiences.data ?? []
                            self.resultsWithoutFilteration = cachedExperiences.data ?? []
                        } else {
                            self.alertItem = AlertContext.unableToComplete
                        }
                    }
                }
                completion?()
            }
        }
    }
    
    
    func getRecommendedExperiences(completion: (() -> Void)? = nil) {
        api.getRecommendedExperiences(recommended: true) { [weak self] result in
            DispatchQueue.main.async { [self] in
                guard let self = self else { return }
                
                switch result {
                case .success(let experiences):
                    
                    self.recommendedExperiences = experiences.data ?? []
                    
                    // Save to cache
                    CacheManager.shared.saveData(experiences, filename: self.cacheRecommendedExperiencesFileName)
                    
                    // Preload images for caching
                    self.preloadImages(from: self.mostRecentExperiences)
                    
                case .failure(let error):
                    // Load from cache if API fails
                    
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        if let cachedExperiences: Experiences = CacheManager.shared.loadData(self.cacheRecommendedExperiencesFileName, type: Experiences.self) {
                            self.recommendedExperiencesCached = cachedExperiences
                            self.recommendedExperiences = cachedExperiences.data ?? []
                        } else {
                            self.alertItem = AlertContext.unableToComplete
                        }
                    }
                }
                completion?()
            }
        }
    }
    
    func searchForExperiences(query: String,completion: (() -> Void)? = nil) {
        api.searchForExperiences(query: query) { [weak self] result in
            DispatchQueue.main.async { [self] in
                guard let self = self else { return }
                
                switch result {
                case .success(let experiences):
                    self.searchResults = experiences.data ?? []
                    
                case .failure(_):
                    self.alertItem = AlertContext.invalidResponse
                }
                completion?()
            }
        }
    }
    
    func loadAllData(completion: (() -> Void)? = nil) {
        isLoading = true
        let group = DispatchGroup()
        
        group.enter()
        getMostRecentExperiences {
            group.leave()
        }
        
        group.enter()
        getRecommendedExperiences {
            group.leave()
        }
        
        group.notify(queue: .main) { [weak self] in
            self?.isLoading = false
        }
    }
    
    // For async/await refreshable
    func refreshData() async {
        await withCheckedContinuation { continuation in
            self.loadAllData {
                continuation.resume()
            }
        }
    }
    
    // we use it when we use cached data
    func searchFor(query: String) {
        if query.isEmpty {
            searchResults = []
        } else {
            searchResults = resultsWithoutFilteration.filter {
                $0.title?.localizedCaseInsensitiveContains(query) ?? false
            }
        }
    }
    
    // Preload images for caching
    func preloadImages(from experiences: [ExperienceData]) {
        let urls = experiences.compactMap { URL(string: $0.coverPhoto ?? "") }
        SDWebImagePrefetcher.shared.prefetchURLs(urls)
    }
}
