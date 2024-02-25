//
//  CharacterListRepository.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

class CharacterListRepository: CharacterListRepositoryProtocol {
    private let remoteDataSource: RemoteDataSourceProtocol
    private let characterDomainErrorMapper: CharacterDomainErrorMapper
    private let characterDomainMapper: CharacterDomainMapper
    
    init(remoteDataSource: RemoteDataSourceProtocol,
         characterDomainErrorMapper: CharacterDomainErrorMapper,
         characterDomainMapper: CharacterDomainMapper
    ) {
        self.remoteDataSource = remoteDataSource
        self.characterDomainErrorMapper = characterDomainErrorMapper
        self.characterDomainMapper = characterDomainMapper
    }
    
    func getCharacterList() async -> Result<[CharacterEntity], CharacterDomainError> {
        let characterModelListResult = await remoteDataSource.getCharacterList()
        
        guard case .success(let characterModelList) = characterModelListResult else {
            return .failure(characterDomainErrorMapper.map(error: characterModelListResult.failureValue as? HttpClientError))
        }
        
        let characterEntityList = characterDomainMapper.map(characterModelList: characterModelList)

        return .success(characterEntityList)
    }
}
