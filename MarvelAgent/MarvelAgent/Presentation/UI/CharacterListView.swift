//
//  ContentView.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 23/2/24.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject private var viewModel: CharacterListViewModel = CharacterListFactory.createViewModel()
        
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
            List(viewModel.characterItems, id: \.id) { characterEntity in
                Text(characterEntity.name)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .task {
            await viewModel.fetchData()
        }
    }
}
