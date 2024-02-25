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
        
        NavigationView {
            List(viewModel.characterItems, id: \.id) { characterItem in
                NavigationLink(destination: CharacterDetailsView(characterItem: characterItem)) {
                    LazyHStack{
                        AsyncImage(url: URL(string: characterItem.image)!) { image in
                            image
                                .resizable()
                                .foregroundColor(.accentColor)
                        }
                    placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        Text(characterItem.name)
                            .padding(.leading)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                }
            }
            .task {
                await viewModel.fetchData()
            }
        }.navigationTitle("Items")
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}


