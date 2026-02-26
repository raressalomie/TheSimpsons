//
//  TSCharactersViewModel.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 22/12/25.
//

import Foundation

@Observable
class TSCharactersViewModel {
    private let dataService = TSCharactersDataService()
    private let pageNumber: Int = 1
    var isLoading = false
    var characters: [TSCharacter] = []
    
    func fetchCharacters() async {
        isLoading = true
        do {
            let fetchedCharacters = try await dataService.fetchCharactersFromEndpoint(endpoint: .characters)
            characters.append(contentsOf: fetchedCharacters)
            isLoading = false
        } catch {
            dump(error)
        }
        isLoading = false
    }
}


