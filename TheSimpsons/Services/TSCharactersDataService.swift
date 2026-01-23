//
//  TSCharactersDataService.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 22/12/25.
//

import Foundation

enum TSEndpoint: String {
    case characters = "characters"
    case episodes = "episodes"
    case locations = "locations"
}

class TSCharactersDataService {
    let baseUrlString = "https://thesimpsonsapi.com/api/"
    var nextString: String? = nil
    
    func fetchDataFromEndpoint(endpoint: TSEndpoint) async throws -> [TSCharacter] {
        var urlString: String = ""
        
        if let nextUrl = nextString {
            urlString = nextUrl
        } else {
            urlString = baseUrlString + endpoint.rawValue
        }
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(TSResponse.self, from: data)
        dump(response)
        
        if response.next != nil {
            nextString = response.next
        }
        return response.results
    }
}

class TSCharacterImageDataService {
    let baseUrlString = "https://cdn.thesimpsonsapi.com/1280"
    
    func fetchDataImage(character: TSCharacter) async throws -> Data? {
        let urlString = baseUrlString + character.portraitPath
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        print("urlString: " + urlString)
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
