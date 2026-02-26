//
//  TSLocation.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 24/2/26.
//

import Foundation

struct TSLocation: Codable {
    let id: Int
    let name: String
    let imagePath: String
    let town: String
    let use: String

    enum CodingKeys: String, CodingKey {
        case id, name, town, use
        case imagePath = "image_path"
    }
}
