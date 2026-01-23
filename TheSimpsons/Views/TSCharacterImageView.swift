//
//  TSCharacterImageView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 12/1/26.
//

import SwiftUI

struct TSCharacterImageView: View {
    @State private var vm = TSCharacterImageViewModel()
    let character: TSCharacter
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(
                        Rectangle()
                            .fill(.gray)
                            .opacity(0.5)
                            .cornerRadius(20)
                    )
                    .shadow(radius: 2.0)
            } else if vm.isLoading {
                ProgressView()
                    .frame(width: 100, height: 100)
            } else {
                Image(systemName: "photo")
                    .foregroundColor(.gray)
            }
        }
        .task {
            await vm.getImageForCharacter(character: character)
        }
    }
}

#Preview {
    TSCharacterImageView(character: dev.character)
}
