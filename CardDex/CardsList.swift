//
//  CardsList.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation

class CardList: ObservableObject {
    @Published var cardList: [Card] = []
    @Published var dailyCard: Card?

    public func getCardList() -> [Card] {
        return cardList
    }

    public func getCard(name: String) -> Card {
        cardList.first { $0.name == name } ?? Card(name: "None", marketprice: 0.0, imageName: "", set: "", type: "", hp: "", number: "")
    }

    public func addCard(card: Card) {
        cardList.append(card)
    }

    public func removeCard(removecard: Card) {
        cardList.removeAll { $0.name == removecard.name }
    }
    
    public func getDailyCard() -> Card?{
        return dailyCard
    }
}

