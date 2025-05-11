//
//  Card.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation

class Card: Codable, Identifiable, ObservableObject {
    var id = UUID()  // Required for SwiftUI lists
    var name: String //Name of Card
    var marketprice: Double //Market value of card
    var imageName: String //Image name of card (seperate asset)
    var set: String? //Set of the card
    var type: String? //Element type of card
    var rarity: String //Rarity of card
    var hp: Int? //HP value of card
    var number: String? //Card number in set
    var valuechange: Double // Simulated price change value
    var valueincrease: Bool // Indicates whether the card's value increased

    //Initializing new card with given attributes and generates a random simulated price change
    init(name: String, marketprice: Double, imageName: String, set: String, type: String, hp: String, number: String) {
        self.name = name
        self.marketprice = marketprice
        self.imageName = imageName
        self.set = set
        self.type = type
        self.hp = Int(hp) // Convert HP from string to integer
        self.number = number
        // Generate a simulated value change between -0.15 and 0.15 (formatted to 3 decimal places)
        self.valuechange = Double(String(format: "%.3f", Double.random(in: -0.15...0.15)))!
        // Determine if the value increased or decreased
        self.valueincrease = self.valuechange >= 0
        // Hardcoded rarity for now
        self.rarity = "Ultra Rare"
    }
}
