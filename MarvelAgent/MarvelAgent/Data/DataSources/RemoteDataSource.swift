//
//  RemoteDataSource.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//
import Foundation

class RemoteDataSource: RemoteDataSourceProtocol {
    private let httpClient: HttpClientProtocol
    
    init(httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }
    
    func getCharacterList() async -> Result<[CharacterModel], HttpClientError> {
        let endpoint = Endpoint(method: .get,
                                uriPath: "character",
                                queryParams: [:])
        
        let result = await httpClient.fetchData(endpoint: endpoint)
        
        guard case .success(let data) = result else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }

            return .failure(error)
        }
        
        guard let apiResponseModel = try? JSONDecoder().decode(ApiResponseModel.self, from: data) else {
            return .failure(.parsinError)
        }
        
        let characterModelList = apiResponseModel.results
        
        return .success(characterModelList)
    }
}

let baseUrl = "https://rickandmortyapi.com/api"
