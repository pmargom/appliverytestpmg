//
//  GetCharacterList.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

protocol GetCharacterListUseCaseProtocol {
    func execute() async -> Result<[CharacterEntity], CharacterDomainError>
}

class GetCharacterListUseCase: GetCharacterListUseCaseProtocol {
    private let repository: CharacterListRepositoryProtocol
    
    init(repository: CharacterListRepositoryProtocol) {
        self.repository = repository
    }
    
//    @MainActor
    func execute() async -> Result<[CharacterEntity], CharacterDomainError> {
        let result = await repository.getCharacterList()
        
        guard let characterList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)
        }
        
        return .success(characterList)
    }
}
