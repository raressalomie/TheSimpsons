//
//  TSCharacter.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 22/12/25.
//


import Foundation

// MARK: - TSCharacter
struct TSResponse: Codable {
    let count: Int
    let next: String?
    let prev: String?
    let pages: Int
    let results: [TSCharacter]
}
