//
//  OwnedCards.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation
// Class to manage the list of owned cards
class OwnedCards: ObservableObject {
    // A published list of Card objects, so changes can trigger UI updates
    @Published var cardList: [Card] = []
    
    // URL to save and load the cards from a file
    private let saveURL: URL
    
    // Initializer that sets up the save URL and loads the existing cards from storage
    init() {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.saveURL = documents.appendingPathComponent("OwnedCards.json")
        loadCards()
    }

    // Returns the list of owned cards
    public func getOwnedCards() -> [Card] {
        return cardList
    }
    
    // Calculates and returns the total value of all owned cards
    public func totalValue() -> Double {
        var total: Double = 0
        for card in cardList {
            total += card.marketprice + (card.marketprice * card.valuechange) // Adds market price and any value changes
        }
        return total
    }

    // Retrieves a card by its name, or returns a fallback card if not found
    public func getCard(name: String) -> Card {
        for card in cardList {
            if card.name == name {
                return card
            }
        }
        // Provide a fallback Card with imageName to match new init
        return Card(name: "None", marketprice: 0.0, imageName: "", set: "", type: "", hp: "", number: "")
    }

    // Adds a new card to the list and saves the updated list
    public func addCard(card: Card) {
        cardList.append(card)
        saveCards()
    }

    // Removes a card from the list by its name and saves the updated list
    public func removeCard(removecard: Card) {
        cardList.removeAll { $0.name == removecard.name }
        saveCards()
    }
    
    // Loads the card list from a saved file and decodes it from JSON format
    private func saveCards() {
        do {
            let data = try JSONEncoder().encode(cardList)
            try data.write(to: saveURL)
        } catch {
            print("Failed to save cards: ", error)
        }
    }
    
    // Loads the card list from a saved file and decodes it from JSON format
    private func loadCards() {
        do {
            let data = try Data(contentsOf: saveURL)
            cardList = try JSONDecoder().decode([Card].self, from: data)
        } catch {
            print("Failed to load cards: ", error)
        }
    }
    
    // Calculates and returns the total gain (sum of value changes) of all cards
    public func totalGain() -> Double {
        var total: Double = 0
        for card in cardList {
            total += card.valuechange
        }
        return total
    }
    
    // Calculates and returns the total gain percentage based on value change and total value
    public func totalGainPercentage() -> Double {
        return (totalGain() / totalValue()) * 100
    }
    
    // Returns a boolean indicating whether the total gain is positive (value change > 0)
    public func valuechange() -> Bool {
        return totalGainPercentage() > 0
    }
    
    // Randomly shuffles the value change of each card within a specified range and saves the updated values
    public func shufflevalues() {
        for card in cardList {
            card.valuechange = Double(String(format: "%.3f", Double.random(in: -15...15)))!
            card.valueincrease = card.valuechange >= 0
        }
        saveCards()
    }
}
