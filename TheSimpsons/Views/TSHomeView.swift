//
//  HomeView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 12/2/26.
//

import SwiftUI

struct TSHomeView: View {
    @State private var vm = TSCharactersViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.isLoading {
                    ProgressView()
                        .frame(width: 200, height: 200)
                    Text("Fertching data...")
                } else {
                    characterList
                }
            }
            .navigationTitle("The Simpsons")
            .task {
                await vm.fetchCharacters()
            }
        }
    }
}

extension TSHomeView {
    private var characterList: some View {
        List {
            ForEach(vm.characters, id: \.id) { character in
                NavigationLink {
                    TSCharacterView(character: character)
                } label: {
                    TSCharacterViewRow(character: character)
                        .id(character.id)
                }
                .onAppear {
                    if character.id == vm.characters.last?.id {
                        Task { await vm.fetchCharacters() }
                    }
                }
            }
        }
    }
}

#Preview {
    TSHomeView()
}
