//
//  Card.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation


public struct PokemonCardResponse: Codable {
    public let data: [Card]
    public let page: Int
    public let pageSize: Int
    public let count: Int
    public let totalCount: Int
}

public struct PokemonCard: Codable, Sendable {
    public let data: Card
}

public struct Card: Codable, Sendable {
    public let id: String
    public let name: String
    public let supertype: String
    public let subtypes: [String]?
    public let level: String?
    public let hp: String?
    public let types: [String]?
    public let evolvesFrom: String?
    public let evolvesTo: [String]?
    public let rules: [String]?
    public let ancientTrait: AncientTrait?
    public let abilities: [Ability]?
    public let attacks: [Attack]?
    public let weaknesses: [Weakness]?
    public let resistances: [Resistance]?
    public let retreatCost: [String]?
    public let convertedRetreatCost: Int?
    public let set: Set?
    public let number: String?
    public let artist: String?
    public let rarity: String?
    public let flavorText: String?
    public let nationalPokedexNumbers: [Int]?
    public let legality: Legality?
    public let regulationMark: String?
    public let images: CardImages?
    public let tcgplayer: TCGPlayer?
    public let cardmarket: CardMarket?
}
