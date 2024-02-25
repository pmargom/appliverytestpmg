//
//  Equatable.swift
//  MarvelAgentTests
//
//  Created by Pedro Martín Gómez on 25/2/24.
//

@testable import MarvelAgent

extension CharacterEntity: Equatable {
    public static func == (lhs: CharacterEntity, rhs: CharacterEntity) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
        && lhs.gender == rhs.gender
        && lhs.species == rhs.species
        && lhs.image == rhs.image
    }
}

extension CharacterModel: Equatable {
    public static func == (lhs: CharacterModel, rhs: CharacterModel) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
        && lhs.gender == rhs.gender
        && lhs.species == rhs.species
        && lhs.image == rhs.image
    }
}
