//
//  CharacterModel.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let species: String
    let gender: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, species, gender, image
    }
}
