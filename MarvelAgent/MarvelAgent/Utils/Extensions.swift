//
//  Extensions.swift
//  MarvelAgent
//
//  Created by Pedro Martín Gómez on 24/2/24.
//

extension Result {
    var failureValue: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}
