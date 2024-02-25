//
//  HttpClientError.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

enum HttpClientError: Error {
    case clientError
    case ServerError
    case generic
    case parsinError
    case badURL
    case responseError
}
