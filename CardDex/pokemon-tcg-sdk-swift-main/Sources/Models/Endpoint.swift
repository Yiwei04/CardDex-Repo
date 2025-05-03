//
//  Endpoint.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

public struct Endpoint {
    let path: String
    let parameters: [String: String]?

    public init(path: String, parameters: [String : String]? = nil) {
        self.path = path
        self.parameters = parameters
    }

    public var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.pokemontcg.io"
        components.path = "/v2/\(path)"
        if let parameters {
            components.queryItems = parameters.map({ URLQueryItem(name: $0.key, value: $0.value) })
        }
        return components.url
    }
}
