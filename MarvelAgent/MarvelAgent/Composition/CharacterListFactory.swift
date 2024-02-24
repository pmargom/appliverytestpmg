//
//  CharacterListFactory.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

import Foundation

@MainActor
class CharacterListFactory {
    static func create() -> CharacterListView {
//        return CharacterListView(viewModel: createViewModel())
        return CharacterListView()
    }
    
    static func createViewModel() -> CharacterListViewModel {
        return CharacterListViewModel(getCharacterListUseCase: createUseCase())
    }
    
    private static func createUseCase() -> GetCharacterListUseCaseProtocol {
        return GetCharacterListUseCase(repository: createRepository())
    }
    
    private static func createRepository() -> CharacterListRepositoryProtocol {
        return CharacterListRepository(remoteDataSource: createDataSource(),
                                       characterDomainErrorMapper: CharacterDomainErrorMapper(),
                                       characterDomainMapper: CharacterDomainMapper())
    }
    
    private static func createDataSource() -> RemoteDataSourceProtocol {
        let urlRequestBuilder = URLRequestBuilder()
        let urlResponseErrorProcessor = URLResponseErrorProcessor()
        
        let httpClient = URLSessionHttpClient(urlRequestBuilder: urlRequestBuilder,
                                              urlResponseErrorProcessor: urlResponseErrorProcessor)
        
        return RemoteDataSource(httpClient: httpClient)
    }
}
