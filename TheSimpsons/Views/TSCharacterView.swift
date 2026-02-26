//
//  TSCharacterView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 22/12/25.
//

import SwiftUI

struct TSCharacterView: View {
    let character: TSCharacter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(character.name)
            Text(character.gender)
            Text(character.occupation)
            Text(String(character.age ?? 0))
            
            if character.birthdate != nil { Text(character.birthdate!)
            }
        }
        .padding()
    }
}

#Preview {
    TSCharacterView(character: dev.character)
}
