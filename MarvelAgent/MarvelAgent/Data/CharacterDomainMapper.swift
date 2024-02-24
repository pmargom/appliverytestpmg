//
//  CharacterDomainMapper.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

class CharacterDomainMapper {
    func map(characterModelList: [CharacterModel]) -> [CharacterEntity] {
        return characterModelList.map { characterModel in
            CharacterEntity(id: characterModel.id,
                            name: characterModel.name,
                            species: characterModel.species,
                            gender: characterModel.gender,
                            image: characterModel.image)
        }
    }
}
