//
//  CharacterDetailsView.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 25/2/24.
//

import SwiftUI

struct CharacterDetailsView: View {
    let characterItem: CharacterListItem
    
    var body: some View {    
        VStack() {
            HStack {
                AsyncImage(url: URL(string: characterItem.image)!) { image in
                    image
                        .resizable()
                        .foregroundColor(.accentColor)
                }
            placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 160)
                
                VStack(alignment: .leading) {
                    Text(characterItem.name)
                        .font(.largeTitle)
                        .padding()
                    
                    Text(characterItem.gender)
                        .font(.largeTitle)
                        .padding()
                    
                    Text(characterItem.species)
                        .font(.largeTitle)
                        .padding()
                }
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
