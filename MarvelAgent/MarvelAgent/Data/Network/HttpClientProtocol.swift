//
//  HttpClientProtocol.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

import Foundation

protocol HttpClientProtocol {
    func fetchData(endpoint: Endpoint) async -> Result<Data, HttpClientError>
}
