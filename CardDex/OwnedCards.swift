//
//  OwnedCards.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation

class OwnedCards: ObservableObject {
    @Published var cardList: [Card] = []

    func getOwnedCards() -> [Card] {
        return cardList
    }

    func getCard(name: String) -> Card {
        for card in cardList {
            if card.name == name {
                return card
            }
        }
        // Provide a fallback Card with imageName to match new init
        return Card(name: "None", marketprice: 0.0, imageName: "")
    }

    func addCard(card: Card) {
        cardList.append(card)
    }

    func removeCard(removecard: Card) {
        cardList.removeAll { $0.name == removecard.name }
    }
}
