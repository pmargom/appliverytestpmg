//
//  URLRequestBuilder.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

import Foundation

class URLRequestBuilder {
    func url(for endPoint: Endpoint) -> URL? {
        var urlComponents = URLComponents(string: "\(baseUrl)/\(endPoint.uriPath)")
        let urlQueryParameters = endPoint.queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)")}
        
        urlComponents?.queryItems = urlQueryParameters
        
        return urlComponents?.url
    }
}
