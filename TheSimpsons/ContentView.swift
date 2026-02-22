//
//  ContentView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 1/12/25.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                TSHomeView()
            }
            
            Tab("Episodes", systemImage: "tv") {
                TSEpisodesView()
            }
            
            Tab("Locations", systemImage: "map") {
                TSLocationsView()
            }
            
            Tab(role: .search) {
                DemoView(searchText: $searchText)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
