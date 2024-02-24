//
//  RemoteDataSourceProtocol.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

protocol RemoteDataSourceProtocol {
    func getCharacterList() async -> Result<[CharacterModel], HttpClientError>
}
