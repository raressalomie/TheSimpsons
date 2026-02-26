//
//  TSLocationsViewModel.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 26/2/26.
//

import Foundation

@Observable
class TSLocationsViewModel {
    private let dataService = TSLocationDataService()
    private let pageNumber: Int = 1
    var isLoading = false
    var locations: [TSLocation] = []
    
    func fetchLocations() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let fetchedLocations = try await dataService.fetchLocations()
            locations.append(contentsOf: fetchedLocations)
        } catch {
            dump(error)
        }
    }
    
}
