//
//  Card.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation

class Card: Identifiable, ObservableObject {
    let id = UUID()  // Required for SwiftUI lists
    var name: String
    var marketprice: Double
    var imageName: String

    init(name: String, marketprice: Double, imageName: String) {
        self.name = name
        self.marketprice = marketprice
        self.imageName = imageName
    }
}
