//
//  APIServices.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 07/09/2025.
//

import Foundation

protocol APIServiceProtocol {
    func getRecommendedExperiences(recommended: Bool, completion: @escaping(Swift.Result<Experiences, APError>) -> Void)
    func getMostRecentExperiences(completion: @escaping(Swift.Result<Experiences, APError>) -> Void)
    func getExperienceDetails(id: String, completion: @escaping(Swift.Result<ExperienceDetails, APError>) -> Void)
    func postLikeExperience(id: Int, completion: @escaping(Swift.Result<ExperienceData, APError>) -> Void)
    func searchForExperiences(query: String, completion: @escaping(Swift.Result<Experiences, APError>) -> Void)
}

class APIService: NSObject, APIServiceProtocol {

    //Staic iConstant
    static let shared   = APIService()
    static let baseURL  = "https://aroundegypt.34ml.com"

    //Private iConstant
    private let experiencesURL = baseURL + "/api/v2/experiences"
    
    // MARK: - getMostRecentExperiences
    func getRecommendedExperiences(recommended: Bool, completion: @escaping(Swift.Result<Experiences, APError>) -> Void) {
        APIService.shared.request(url: experiencesURL  + "?filter[recommended]=\(recommended)", completed: completion)
    }
    
    // MARK: - getMostRecentExperiences
    func getMostRecentExperiences(completion: @escaping(Swift.Result<Experiences, APError>) -> Void) {
        APIService.shared.request(url: experiencesURL , completed: completion)
    }

    // MARK: - getExperiencesDetails
    func getExperienceDetails(id: String, completion: @escaping(Swift.Result<ExperienceDetails, APError>) -> Void) {
        APIService.shared.request(url: experiencesURL + "/\(id)", completed: completion)
    }
    
    // MARK: - getExperiencesDetails
    func postLikeExperience(id: Int, completion: @escaping(Swift.Result<ExperienceData, APError>) -> Void){
        APIService.shared.request(url: experiencesURL + "/\(id)", completed: completion)
    }

    func searchForExperiences(query: String, completion: @escaping(Swift.Result<Experiences, APError>) -> Void) {
        APIService.shared.request(url: experiencesURL  + "?filter[title]=\(query)", completed: completion)
    }
    
    // MARK: - APIService
    func request<T: Decodable>(url: String, completed: @escaping (Swift.Result<T, APError>) -> Void) {
        guard let url = URL(string: url) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in

            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: data)
                completed(.success(decodedResponse.self))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
