//
//  LocalFileManager.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 25/1/26.
//

import Foundation
import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    private init() {}
    
    func saveImage(imageData: Data?, imageName: String, folderName: String) {
        
        //create folder
        createFolderIfNeeded(folderName: folderName)
        
        //get path for image
        guard
            let data = imageData,
            let url = getURLForImage(imageName: imageName, folderName: folderName)
        else { return }
        
        //save image to path
        do {
            try data.write(to: url)
            print("Image saved")
        } catch {
            print("Error saving image: \(error.localizedDescription). ImageName: \(imageName).")
        }
    }
    
    func getImage(imageName: String, folderName: String) -> UIImage? {
        
        guard
            let url = getURLForImage(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path)
        
    }
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating directory: \(error.localizedDescription). Folder name: \(folderName).")
            }
        } else {
            print("Folder already existing!")
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else { return nil }
        let finalURL = url.appendingPathComponent(folderName)
        print("Final URL: \(finalURL)")
        return finalURL
    }
    
    private func getURLForImage(imageName: String, folderName: String) -> URL? {
        guard let folderURL = getURLForFolder(folderName: folderName) else {
            return nil
        }
        let imageUrl = folderURL.appendingPathComponent(imageName + ".webp")
        print("imageUrl: \(imageUrl)")
        
        return imageUrl
        
    }
    
}
