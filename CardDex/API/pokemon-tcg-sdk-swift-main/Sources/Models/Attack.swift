//
//  Attack.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

public struct Attack: Codable, Sendable {
    public let name: String
    public let cost: [String]?
    public let text: String?
    public let damage: String?
    public let convertedEnergyCost: Int
}
