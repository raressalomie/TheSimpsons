//
//  TSLocationsView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 12/2/26.
//

import SwiftUI

struct TSLocationsView: View {
    @State private var vm = TSLocationsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.isLoading {
                    ProgressView()
                        .frame(width: 200, height: 200)
                    Text("Fetching data...")
                } else {
                    locationsView
                }
            }
            .navigationTitle("Episodes")
            .task {
                await vm.fetchLocations()
            }
        }
    }
}

extension TSLocationsView {
    
    var locationsView: some View {
        List {
            ForEach(vm.locations, id: \.id) { location in
                Text(location.name)
            }
        }
    }
}

#Preview {
    TSLocationsView()
}
