//
//  TCGPlayer.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

public struct TCGPlayer: Codable, Sendable {
    public let url: String
    public let updatedAt: String
    public let prices: Prices?

    public struct Prices: Codable, Sendable {
        public let normal: PriceDetails?
        public let holofoil: PriceDetails?
        public let reverseHolofoil: PriceDetails?
        public let firstEditionHolofoil: PriceDetails?
        public let firstEditionNormal: PriceDetails?
    }

    public struct PriceDetails: Codable, Sendable {
        public let low: Double?
        public let mid: Double?
        public let high: Double?
        public let market: Double?
        public let directLow: Double?
    }
}
