//
//  Card.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation

class Card: Codable, Identifiable, ObservableObject {
    var id = UUID()  // Required for SwiftUI lists
    var name: String
    var marketprice: Double
    var imageName: String
    var set: String?
    var type: String?
    var rarity: String
    var hp: Int?
    var number: String?
    var valuechange: Double
    var valueincrease: Bool

    init(name: String, marketprice: Double, imageName: String, set: String, type: String, hp: String, number: String) {
        self.name = name
        self.marketprice = marketprice
        self.imageName = imageName
        self.set = set
        self.type = type
        self.hp = Int(hp)
        self.number = number
        self.valuechange = 0.00
        self.valueincrease = true
        self.rarity = "Ultra Rare"
    }
}
