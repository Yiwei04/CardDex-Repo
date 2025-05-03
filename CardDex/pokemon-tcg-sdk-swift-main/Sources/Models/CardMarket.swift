//
//  CardMarket.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

public struct CardMarket: Codable, Sendable {
    public let url: String
    public let updatedAt: String
    public let prices: CardMarketPrices?

    public struct CardMarketPrices: Codable, Sendable {
        public let averageSellPrice: Double?
        public let lowPrice: Double?
        public let trendPrice: Double?
        public let germanProLow: Double?
        public let suggestedPrice: Double?
        public let reverseHoloSell: Double?
        public let reverseHoloLow: Double?
        public let reverseHoloTrend: Double?
        public let lowPriceExPlus: Double?
        public let avg1: Double?
        public let avg7: Double?
        public let avg30: Double?
        public let reverseHoloAvg1: Double?
        public let reverseHoloAvg7: Double?
        public let reverseHoloAvg30: Double?
    }
}
