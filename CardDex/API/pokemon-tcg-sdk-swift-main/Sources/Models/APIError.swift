//
//  APIError.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

public enum APIError: Error {
    case networkError(Error)
    case decodingError(Error)
    case invalidResponse
    case unknown
}
