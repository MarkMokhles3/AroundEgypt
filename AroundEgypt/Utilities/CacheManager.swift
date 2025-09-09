//
//  CacheManager.swift
//  AroundEgypt
//
//  Created by Mark Mokhles on 09/09/2025.
//


import Foundation

struct CacheManager {
    
    static let shared = CacheManager()
    
    private init() {}
    
    private var documentsDirectory: URL {
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        }
    
    func saveData<T: Codable>(_ object: T, filename: String) {
        let url = getFileURL(filename: filename)
        if let data = try? JSONEncoder().encode(object) {
            try? data.write(to: url)
        }
    }
    
    func loadData<T: Codable>(_ filename: String, type: T.Type) -> T? {
        let url = getFileURL(filename: filename)
        guard let data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode(type, from: data)
    }
    
    private func getFileURL(filename: String) -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(filename)
    }
    
    /// convenience to clear a cache file for unit testing
        func clearCache(filename: String) {
            let url = documentsDirectory.appendingPathComponent(filename)
            try? FileManager.default.removeItem(at: url)
        }
}
