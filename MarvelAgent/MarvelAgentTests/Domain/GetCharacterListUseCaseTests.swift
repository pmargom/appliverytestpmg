//
//  GetCharacterListUseCaseTests.swift
//  MarvelAgentTests
//
//  Created by Pedro Martín Gómez on 25/2/24.
//

import XCTest
@testable import MarvelAgent

final class GetCharacterListUseCaseTests: XCTestCase {
    
    func test_execute_successfully_returns_array_when_repository_returns_nonEmpty_array() async throws {
        // GIVEN
        let mockArray = [
            CharacterEntity(id: 1, name: "Name1", species: "Specie 1", gender: "Male", image: "https://"),
            CharacterEntity(id: 2, name: "Name2", species: "Specie 2", gender: "Female", image: "https://"),
            CharacterEntity(id: 3, name: "Name3", species: "Specie 3", gender: "Male", image: "https://"),
        ]
        
        let result: Result<[CharacterEntity], CharacterDomainError> = .success(mockArray)
        let stub = CharacterListRepositoryStub(result: result)
        let sut = GetCharacterListUseCase(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute()
        
        // THEN
        let capturedCharacterList = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(result, capturedResult)
        XCTAssertEqual(capturedCharacterList.count, mockArray.count)
    }
    
    func test_execute_successfully_returns_array_when_repository_returns_anEmpty_array() async throws {
        // GIVEN
        let mockArray: [CharacterEntity] = []
        
        let result: Result<[CharacterEntity], CharacterDomainError> = .success(mockArray)
        let stub = CharacterListRepositoryStub(result: result)
        let sut = GetCharacterListUseCase(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute()
        
        // THEN
        let capturedCharacterList = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(result, capturedResult)
        XCTAssertEqual(capturedCharacterList.count, mockArray.count)
        XCTAssertEqual(capturedCharacterList.count, 0)
    }
    
    func test_execute_returns_error_when_repository_returns_error() async throws {
        // GIVEN
        let result: Result<[CharacterEntity], CharacterDomainError> = .failure(.generic)
        let stub = CharacterListRepositoryStub(result: result)
        let sut = GetCharacterListUseCase(repository: stub)
        
        // WHEN
        let capturedResult = await sut.execute()
        
        // THEN
        XCTAssertEqual(result, capturedResult)
    }
}
