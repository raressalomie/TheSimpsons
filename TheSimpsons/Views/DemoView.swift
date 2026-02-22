//
//  DemoView.swift
//  TheSimpsons
//
//  Created by Rares Salomie on 12/2/26.
//

import SwiftUI

struct DemoView: View {
    @Binding var searchText: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Text("Search View")
                    .focused($isFocused)
            }
            .navigationTitle("Seearch")
            .searchable(text: $searchText)
            .onAppear {
                isFocused = true
            }
        }
    }
}

#Preview {
    DemoView(searchText: .constant("Text"))
}
