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
    @Published var items: [Item] = []
    
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

    
//    func onAppear() {
//        Task {
//            let result = await getCharacterListUseCase.execute()
//            let characterEntityList = try? result.get()
//            guard let characterEntityList else {
//                return
//            }
//
//            characterEntities = characterEntityList.map { CharacterListItem(characterEntity: $0) }
//        }
//    }
    
    func loadData() async {
        // Simulamos un retraso para la carga de datos
        try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 segundos
        
        // Actualizamos los items
        items = [
            Item(id: 1, name: "Item 1 cargado"),
            Item(id: 2, name: "Item 2 cargado"),
            Item(id: 3, name: "Item 3 cargado")
        ]
    }
}

struct Item: Identifiable {
    let id: Int
    let name: String
}

