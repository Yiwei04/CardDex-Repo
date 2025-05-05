//
//  Legalities.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

public struct Legality: Codable, Sendable {
    public let standard: String?
    public let expanded: String?
    public let unlimited: String?
}
