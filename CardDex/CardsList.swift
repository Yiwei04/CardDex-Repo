//
//  CardsList.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation

class CardList: ObservableObject {
    @Published var cardList: [Card] = []

    func getCardList() -> [Card] {
        return cardList
    }

    func getCard(name: String) -> Card {
        cardList.first { $0.name == name } ?? Card(name: "None", marketprice: 0.0, imageName: "")
    }

    func addCard(card: Card) {
        cardList.append(card)
    }

    func removeCard(removecard: Card) {
        cardList.removeAll { $0.name == removecard.name }
    }
}

