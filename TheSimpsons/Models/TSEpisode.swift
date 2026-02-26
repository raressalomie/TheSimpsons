//
//  TSEpisode.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 24/2/26.
//

import Foundation

struct TSEpisode: Codable {
    let id: Int
    let airdate: String
    let episodeNumber: Int
    let imagePath: String
    let name: String
    let season: Int
    let synopsis: String
    
    enum CodingKeys: String, CodingKey {
        case id, airdate, name, season, synopsis
        case episodeNumber = "episode_number"
        case imagePath = "image_path"
    }
}
