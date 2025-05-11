//
//  OwnedCards.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation

class OwnedCards: ObservableObject {
    @Published var cardList: [Card] = []
    private let saveURL: URL
    
    init() {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.saveURL = documents.appendingPathComponent("OwnedCards.json")
        loadCards()
    }

    public func getOwnedCards() -> [Card] {
        return cardList
    }

    public func getCard(name: String) -> Card {
        for card in cardList {
            if card.name == name {
                return card
            }
        }
        // Provide a fallback Card with imageName to match new init
        return Card(name: "None", marketprice: 0.0, imageName: "", set: "", type: "", hp: "", number: "")
    }

    public func addCard(card: Card) {
        cardList.append(card)
        saveCards()
    }

    public func removeCard(removecard: Card) {
        cardList.removeAll { $0.name == removecard.name }
        saveCards()
    }
    
    private func saveCards() {
        do {
            let data = try JSONEncoder().encode(cardList)
            try data.write(to: saveURL)
        } catch {
            print("Failed to save cards: ", error)
        }
    }
    
    private func loadCards() {
        do {
            let data = try Data(contentsOf: saveURL)
            cardList = try JSONDecoder().decode([Card].self, from: data)
        } catch {
            print("Failed to load cards: ", error)
        }
    }
}
