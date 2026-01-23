//
//  ContentView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 1/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = TSCharactersViewModel()
    @State private var dataservice = TSCharactersDataService()
    @State private var characters: [TSCharacter] = []
    
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

extension ContentView {
     
    private var characterList: some View {
        List {
            ForEach(vm.characters, id: \.id) { character in
                NavigationLink {
                    TSCharacterView(character: character)
                } label: {
                    TSCharacterViewRow(character: character)
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
    ContentView()
}
