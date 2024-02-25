//
//  CharacterListRepositoryStub.swift
//  MarvelAgentTests
//
//  Created by Pedro Martín Gómez on 25/2/24.
//

@testable import MarvelAgent

class CharacterListRepositoryStub: CharacterListRepositoryProtocol {
    private let result: Result<[CharacterEntity], CharacterDomainError>
    
    init(result: Result<[CharacterEntity], CharacterDomainError>) {
        self.result = result
    }
    
    func getCharacterList() async -> Result<[CharacterEntity], CharacterDomainError> {
        return result
    }
}
