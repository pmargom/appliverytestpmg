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
        Text("Selected \(characterItem.name)")
            .font(.largeTitle)
            .padding()
    }
}
