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
    
    func saveImage(folderName: String) {
        createFolderIfNeeded(folderName: folderName)
    }
    
    
    private func createFolderIfNeeded(folderName: String) {
        guard let url = getURLForFolder(folderName: folderName) else { return }
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Error creating directory: \(error.localizedDescription). Folder name: \(folderName).")
            }
        }
    }
    
    private func getURLForFolder(folderName: String) -> URL? {
        
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return url.appendingPathComponent(folderName)
    }
    
}
