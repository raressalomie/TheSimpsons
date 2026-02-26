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
    
    func fetchCharactersFromEndpoint(endpoint: TSEndpoint) async throws -> [TSCharacter] {
        var urlString: String = ""
        
        if let nextUrl = nextString {
            urlString = nextUrl
        } else {
            urlString = baseUrlString + endpoint.rawValue
        }
        
        let response: TSResponse<TSCharacter> = try await DataFetchManager.shared.fetch(urlString: urlString)
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

class TSEpisodeDataService {
    let baseUrlString = "https://thesimpsonsapi.com/api/"
    
    func fetchEpisodes() async throws -> [TSEpisode] {
        let urlString = baseUrlString + TSEndpoint.episodes.rawValue
        let response: TSResponse<TSEpisode> = try await DataFetchManager.shared.fetch(urlString: urlString)
        dump(response)
        
        return response.results
    }
}

class TSLocationDataService {
    let baseUrlString = "https://thesimpsonsapi.com/api/"
    
    func fetchLocations() async throws -> [TSLocation] {
        let urlString = baseUrlString + TSEndpoint.locations.rawValue
        let response: TSResponse<TSLocation> = try await DataFetchManager.shared.fetch(urlString: urlString)
        dump(response)
        
        return response.results
    }
    
}

protocol DataService {
    
}
