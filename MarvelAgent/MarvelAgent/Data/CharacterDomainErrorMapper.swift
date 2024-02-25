//
//  CharacterDomainErrorMapper.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

class CharacterDomainErrorMapper {
    func map(error: HttpClientError?) -> CharacterDomainError {
        return .generic
    }
}
