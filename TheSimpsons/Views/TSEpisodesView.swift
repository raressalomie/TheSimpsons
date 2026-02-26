//
//  TSEpisodesView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 12/2/26.
//

import SwiftUI

struct TSEpisodesView: View {
    @State private var vm = TSEpisodesViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.isLoading {
                    ProgressView()
                        .frame(width: 200, height: 200)
                    Text("Fetching data...")
                } else {
                    episodesView
                }
            }
            .navigationTitle("Episodes")
            .task {
                await vm.fetchEpisodes()
            }
        }
        
    }
}

extension TSEpisodesView {
    
    var episodesView: some View {
        List {
            ForEach(vm.episodes, id: \.id) { episode in
                Text(episode.name)
            }
        }
    }
}

#Preview {
    TSEpisodesView()
}
