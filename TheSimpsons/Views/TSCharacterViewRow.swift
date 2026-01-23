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
            /*AsyncImage(url: URL(string: character.imageUrl)) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(
                        Rectangle()
                            .fill(.gray)
                            .opacity(0.5)
                            .cornerRadius(20)
                    )
                    .shadow(radius: 2.0)
                
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            }*/
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
