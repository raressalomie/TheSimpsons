//
//  TSImageCharacterViewModel.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 12/1/26.
//

import Foundation
import SwiftUI

@Observable
class TSCharacterImageViewModel {
    private let dataService = TSCharacterImageDataService()
    var image: UIImage? = nil
    var isLoading: Bool = false
    
    func getImageForCharacter(character: TSCharacter) async {
        isLoading = true
        do {
            let data = try await dataService.fetchDataImage(character: character)
            guard let data = data else {
                print("Bad data")
                isLoading = false
                return
            }
            image = UIImage(data: data)
            self.image = image
        } catch {
            print("|-- getImageForCharacter error: \(error.localizedDescription) --|")
        }

        isLoading = false
    }
}
