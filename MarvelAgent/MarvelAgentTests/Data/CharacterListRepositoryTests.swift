//
//  CharacterListRepositoryTests.swift
//  MarvelAgentTests
//
//  Created by Pedro Martín Gómez on 25/2/24.
//

import XCTest
@testable import MarvelAgent

class RemoteDataSourceStub: RemoteDataSourceProtocol {
    private let characterList: Result<[CharacterModel], HttpClientError>
    
    init(characterList: Result<[CharacterModel], HttpClientError>) {
        self.characterList = characterList
    }
    
    func getCharacterList() async -> Result<[CharacterModel], HttpClientError> {
        return characterList
    }
}

final class CharacterListRepositoryTests: XCTestCase {

    func test_characterList_returns_success() async throws {
        // GIVEN
        let stub = RemoteDataSourceStub(characterList: .success(CharacterModel.makeCharacterModelList()))
        
        let sut = CharacterListRepository(remoteDataSource: stub,
                                          characterDomainErrorMapper: CharacterDomainErrorMapper(),
                                          characterDomainMapper: CharacterDomainMapper())
        // WHEN
        let capturedResult = await sut.getCharacterList()
        
        // THEN
        let capturedCharacterList = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedCharacterList, CharacterEntity.makeCharacterModelList())
    }
    
    func test_characterList_returns_failure_when_remote_data_source_fails_onGetCharacterList() async throws {
        // GIVEN
        let stub = RemoteDataSourceStub(characterList: .failure(.clientError))
        
        let sut = CharacterListRepository(remoteDataSource: stub,
                                          characterDomainErrorMapper: CharacterDomainErrorMapper(),
                                          characterDomainMapper: CharacterDomainMapper())
        // WHEN
        let capturedResult = await sut.getCharacterList()
        
        // THEN
        guard case .failure(let error) = capturedResult else {
            XCTFail("Got success when failure was expected")
            return
        }

        XCTAssertEqual(error, CharacterDomainError.generic)
    }

}

private extension CharacterModel {
    static func makeCharacterModelList() -> [CharacterModel] {
        return [
            CharacterModel(id: 1, name: "Name1", species: "Specie 1", gender: "Male", image: "https://"),
            CharacterModel(id: 2, name: "Name2", species: "Specie 2", gender: "Female", image: "https://"),
            CharacterModel(id: 3, name: "Name3", species: "Specie 3", gender: "Male", image: "https://"),
        ]
    }
}

private extension CharacterEntity {
    static func makeCharacterModelList() -> [CharacterEntity] {
        return [
            CharacterEntity(id: 1, name: "Name1", species: "Specie 1", gender: "Male", image: "https://"),
            CharacterEntity(id: 2, name: "Name2", species: "Specie 2", gender: "Female", image: "https://"),
            CharacterEntity(id: 3, name: "Name3", species: "Specie 3", gender: "Male", image: "https://"),
        ]
    }
}
