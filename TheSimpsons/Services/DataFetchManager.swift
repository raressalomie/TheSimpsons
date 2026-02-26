//
//  DataFetchManager.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 23/2/26.
//

import Foundation

class DataFetchManager {
    
    static let shared = DataFetchManager()
    
    private init() {}
    
    func fetch<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
