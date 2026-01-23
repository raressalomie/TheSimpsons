//
//  TSCharacter.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 22/12/25.
//


import Foundation

// MARK: - Result
struct TSCharacter: Codable {
    let id, age: Int?
    let birthdate: String?
    let gender, name, occupation: String
    let portraitPath: String
    let phrases: [String]?
    let status: String?
    
    var imageUrl: String {
        let urlString = "https://cdn.thesimpsonsapi.com/1280"
        print("Full string: \(urlString + portraitPath)")
        return urlString + portraitPath
        
    }

    enum CodingKeys: String, CodingKey {
        case id, age, birthdate, gender, name, occupation
        case portraitPath = "portrait_path"
        case phrases, status
    }
}
