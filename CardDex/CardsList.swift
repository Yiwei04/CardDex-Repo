//
//  CardsList.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation

// A class that manages a list of all available cards in the app.
class CardList: ObservableObject {
    // The list of all cards available in the app.
    @Published var cardList: [Card] = []
    // The special card designated as the "daily card" (can be nil).
    @Published var dailyCard: Card?

    // Returns the current list of cards.
    public func getCardList() -> [Card] {
        return cardList
    }

    // Retrieves a card by its name. If not found, returns a default "None" card.
    public func getCard(name: String) -> Card {
        cardList.first { $0.name == name } ?? Card(name: "None", marketprice: 0.0, imageName: "", set: "", type: "", hp: "", number: "")
    }

    // Adds a new card to the list.
    public func addCard(card: Card) {
        cardList.append(card)
    }

    // Removes a card from the list by matching its name.
    public func removeCard(removecard: Card) {
        cardList.removeAll { $0.name == removecard.name }
    }
    
    // Returns the current daily card, if one is set.
    public func getDailyCard() -> Card?{
        return dailyCard
    }
}
