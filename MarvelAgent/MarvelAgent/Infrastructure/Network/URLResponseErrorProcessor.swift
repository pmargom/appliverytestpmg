//
//  URLResponseErrorProcessor.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

import Foundation

class URLResponseErrorProcessor {
    func process(statusCode: Int) -> HttpClientError {
        guard statusCode < 500 else {
            return .clientError
        }
        
        return .ServerError
    }
    
    func process(error: Error) -> HttpClientError {
        //TODO: do something specific with error...
        return .generic
    }
}
