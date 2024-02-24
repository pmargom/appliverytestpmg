//
//  URLSessionHttpClient.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

import Foundation

class URLSessionHttpClient: HttpClientProtocol {
    let session: URLSession
    let urlRequestBuilder: URLRequestBuilder
    let urlResponseErrorProcessor: URLResponseErrorProcessor
    
    init(session: URLSession = .shared,
         urlRequestBuilder: URLRequestBuilder,
         urlResponseErrorProcessor: URLResponseErrorProcessor) {
        self.session = session
        self.urlRequestBuilder = urlRequestBuilder
        self.urlResponseErrorProcessor = urlResponseErrorProcessor
    }
    
    func fetchData(endpoint: Endpoint) async -> Result<Data, HttpClientError> {
        
        guard let url = urlRequestBuilder.url(for: endpoint) else {
            return .failure(.badURL)
        }
        
        do {
            let result = try await session.data(from: url)
            
            guard let response = result.1 as? HTTPURLResponse else {
                return .failure(.responseError)
            }
            
            guard response.statusCode == 200 else {
                return .failure(urlResponseErrorProcessor.process(statusCode: response.statusCode))
            }
            
            return .success(result.0)
        } catch {
            return .failure(urlResponseErrorProcessor.process(error: error))
        }
    }
    
    
}
