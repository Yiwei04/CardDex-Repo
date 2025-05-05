//
//  Set.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

import Foundation

public struct SetResponse: Codable, Sendable {
    public let data: [Set]
    public let page: Int
    public let pageSize: Int
    public let count: Int
    public let totalCount: Int
}

public struct PokemonSet: Codable, Sendable {
    public let date: Set
}

public struct Set: Codable, Sendable {
    public let id: String
    public let name: String
    public let series: String
    public let printedTotal: Int
    public let total: Int
    public let legalities: Legality?
    public let ptcgoCode: String?
    public let releaseDate: String
    public let updatedAt: String
    public let images: SetImages

    // MARK: - Nested Types

    public struct SetImages: Codable, Sendable {
        public let symbol: String
        public let logo: String
    }
}
