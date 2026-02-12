//
//  ContentView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 1/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TSHomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            TSEpisodesView()
                .tabItem {
                    Image(systemName: "tv")
                    Text("Episodes")
                }
            
            TSLocationsView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
        }
    }
    
}

#Preview {
    ContentView()
}
