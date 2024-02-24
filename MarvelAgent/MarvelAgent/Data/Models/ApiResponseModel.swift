//
//  ApiResponseModel.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

struct ApiResponseModel: Codable {
    let results: [CharacterModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
