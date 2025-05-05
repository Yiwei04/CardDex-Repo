//
//  Cards.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import Foundation
import SwiftUI

struct CardImages : Codable {
    let small: String
    let large: String
}

struct Card: Codable, Identifiable {
    let id: String
    let name: String
    let images: CardImages
}

struct CardListResponse: Codable {
    let data: [Card]
}


