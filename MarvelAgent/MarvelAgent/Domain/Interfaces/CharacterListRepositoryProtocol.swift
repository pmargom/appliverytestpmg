//
//  CharacterListRepositoryProtocol.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

protocol CharacterListRepositoryProtocol {
    func getCharacterList() async -> Result<[CharacterEntity], CharacterDomainError>
}
