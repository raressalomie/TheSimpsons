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
    private let fileManager = LocalFileManager.instance
    var image: UIImage? = nil
    var isLoading: Bool = false
    var folderName: String = "character_images"
    
    
    func getImageForCharacter(character: TSCharacter) async {
        if let savedImage = fileManager.getImage(imageName: character.name, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager!")
        } else {
            print("Downloading character image...")
            await downloadCharacterImage(character: character)
        }
    }
    
    func downloadCharacterImage(character: TSCharacter) async {
        do {
            let data = try await dataService.fetchDataImage(character: character)
            guard let data = data else {
                print("Bad data")
                isLoading = false
                return
            }
            fileManager.saveImage(imageData: data, imageName: character.name, folderName: folderName)
            image = UIImage(data: data)
            self.image = image
            print("Character image downloaded")
        } catch {
            print("|-- getImageForCharacter error: \(error.localizedDescription) --|")
        }
    }
    
    func saveImage() {
        
    }
}
