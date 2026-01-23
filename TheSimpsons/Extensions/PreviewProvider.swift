//
//  PreviewProvider.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 22/12/25.
//

import Foundation
import SwiftUI

#if DEBUG
let dev = DeveloperPreview.instance
#endif

extension PreviewProvider {
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() {}
    
    let character = TSCharacter(
        id: 1,
        age: 39,
        birthdate: "1956-05-12",
        gender: "Male",
        name: "Homer Simpson",
        occupation: "Safety Inspector",
        portraitPath: "/character/1.webp",
        phrases: [
            "Doh!",
            "Why you little...!",
            "Woo-hoo!",
            "Mmm... (food)... *drooling*",
            "Stupid Flanders!",
            "Shut up Flanders!",
            "AAAAGHH!",
            "Lisa, knock off that racket!",
            "Uh oh, the boss.",
            "Lets all go out for frosty chocolate milkshakes!",
            "Whatever, Ill be at Moes.",
            "I am evil Ho-mer! I am evil Ho-mer! I am evil Ho-mer!",
            "Better them than me.",
            "Better them than me... Oh wait, that was me.",
            "Marge, my face hurts again!"
        ],
        status: "Alive")
}
