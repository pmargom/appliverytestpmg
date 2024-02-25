//
//  CharacterListViewModel.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

import Foundation

struct CharacterListItem {
    let id: Int
    let name: String
    let species: String
    let gender: String
    let image: String
    
    init(characterEntity: CharacterEntity) {
        self.id = characterEntity.id
        self.name = characterEntity.name
        self.species = characterEntity.species
        self.gender = characterEntity.gender
        self.image = characterEntity.image
    }
}

@MainActor
class CharacterListViewModel: ObservableObject {
    private let getCharacterListUseCase: GetCharacterListUseCaseProtocol
    @Published var characterItems: [CharacterListItem] = []
    
    init(getCharacterListUseCase: GetCharacterListUseCaseProtocol) {
        self.getCharacterListUseCase = getCharacterListUseCase
    }
    
    func fetchData() async {
        Task {
            let result = await getCharacterListUseCase.execute()
            let characterEntityList = try? result.get()
            guard let characterEntityList else {
                return
            }
            
            characterItems = characterEntityList.map { CharacterListItem(characterEntity: $0) }
        }
    }
}
