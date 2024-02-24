//
//  Endpoint.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

struct Endpoint {
    let method: HttpMethod
    let uriPath: String
    let queryParams: [String:Any]
}
