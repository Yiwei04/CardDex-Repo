//
//  CardsList.swift
//  CardDex
//
//  Created by Campbell Finlay on 9/5/2025.
//

import Foundation

class CardList {
    var cardList: [Card] = []
    
    func getCardList() -> [Card] {
        return cardList
    }
    
    func getCard(name: String) -> Card {
        for card in cardList{
            if(card.name == name){
                return card
            }
        }
        return Card(name: "None", marketprice: 0.0)
    }
    
    func addCard(card: Card){
        cardList.append(card)
    }
    
    func removeCard(removecard: Card){
        var count: Int = 0
        while(count < cardList.count){
            if(cardList[count].name == removecard.name){
                cardList.remove(at: count)
                continue
            }
        }
    }
}
