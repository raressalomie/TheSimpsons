//
//  TSCharacterViewRow.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 25/12/25.
//

import SwiftUI

struct TSCharacterViewRow: View {
    
    let character: TSCharacter
    
    var body: some View {
        HStack {
            TSCharacterImageView(character: character)
            rightColumn
        }
    }
}

extension TSCharacterViewRow {
    
    private var rightColumn: some View {
        VStack(alignment: .leading) {
            Text(character.name)
                .font(.title)
            
            Text(character.gender)
                .font(.title3)
                
        }
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TSCharacterViewRow(character: dev.character)
}
