//
//  TSEpisodesViewModel.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 26/2/26.
//

import Foundation

@Observable
class TSEpisodesViewModel {
    private let dataService = TSEpisodeDataService()
    private let pageNumber: Int = 1
    var isLoading = false
    var episodes: [TSEpisode] = []
    
    func fetchEpisodes() async {
        isLoading = true
        do {
            let fetchedEpisodes = try await dataService.fetchEpisodes()
            episodes.append(contentsOf: fetchedEpisodes)
            isLoading = false
        } catch {
            dump(error)
        }
        isLoading = false
    }
    
}
