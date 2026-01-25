//
//  TSCharacterView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 22/12/25.
//

import SwiftUI

struct TSCharacterView: View {
    let character: TSCharacter
    private let fileManager = LocalFileManager.instance
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(character.name)
            Text(character.gender)
            Text(character.occupation)
            Text(String(character.age ?? 0))
            Text(character.birthdate ?? "N/A")
        }
        .padding()
        .onAppear {
            fileManager.saveImage(folderName: "TheSimpsons_character_images")
        }
    }
}

#Preview {
    TSCharacterView(character: dev.character)
}
