//
//  CardDetailsView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI
import UIKit

// View displaying detailed information about a single Card.
struct CardDetailsView: View {
    let card: Card //The card whose details are being shown
    @State var colour: Color = .black
    @Environment(\.dismiss) var dismiss //Dismiss action
    @StateObject private var cardsList = CardList() //Full list of cards
    @StateObject private var ownedCardsList = OwnedCards() //User's list of cards
    lazy var cards = cardsList.getCardList() //Lazy loads list of all cards
    lazy var ownedCards = ownedCardsList.getOwnedCards() //Lazy loads list of owned cards
    let cardNotion: Bool // Determines whether to show "+" or "-" action


    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {

                    // Back button → goes to CardsView
                    HStack {
                        Button(action: {
                            dismiss() // Trigger dismiss environment action

                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.yellow)
                                .font(.title2)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)

                    // Card title and rarity
                    VStack(spacing: 6) {
                        Text(card.name)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)

                        Text(card.rarity)
                            .font(.subheadline)
                            .foregroundColor(.yellow)
                            .shadow(color: .black.opacity(0.8), radius: 1, x: 1, y: 1)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                    }

                    // Display Card image
                    Image(card.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)

                    // Market price and price change info
                    VStack(spacing: 6) {
                        Text("Market Price")
                            .foregroundColor(.white)
                            .font(.headline)
                        // Display current market value after applying simulated change
                        Text("$"+String(format: "%.3f", card.marketprice + (card.marketprice * card.valuechange)))
                            .foregroundColor(.white)
                            .font(.system(size: 52, weight: .bold))

                        // Show change percentage with background color
                        HStack(spacing: 10) {
                            Text(String(card.valuechange)+"%")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .cornerRadius(10)
                                .background(colour)
                        }
                    }

                    // Card attributes
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Set: \(card.set ?? "Unknown")").bold()
                        Text("Type: \(card.type ?? "Unknown")").bold()
                        Text("HP: \(card.hp ?? 0)").bold()
                        Text("Card Number: \(card.number ?? "Unknown")").bold()
                    }
                    .font(.body)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)


                    // Smaller gap before battle stats
                    Spacer().frame(height: 5)

                    // Show Add or Remove button based on `cardNotion`
                    if(cardNotion){
                        // "+" button to add card to owned list
                        Button(action: {
                            ownedCardsList.addCard(card: card)
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(.blue)
                                .frame(width: 50, height: 50)
                                .background(Circle().fill(Color.yellow))
                                .shadow(radius: 4)
                        }
                    } else {
                        // "-" button to remove card from owned list
                        Button(action: {
                            if let _ = ownedCardsList.cardList.firstIndex(where: { $0.name == card.name }) {
                                ownedCardsList.removeCard(removecard: card)
                            }
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.red)
                                .frame(width: 50, height: 50)
                                .background(Circle().fill(Color.yellow))
                                .shadow(radius: 4)
                        }
                    }
                }
                .padding()
            }
            .background(Color(red: 0.311, green: 0.089, blue: 0.424).ignoresSafeArea())
        }
        .navigationBarBackButtonHidden(true) // Hide default back button
        
        // Determine color for price change indicator on view appearance
        .onAppear() {
            if(card.valueincrease){
                colour = .green
            } else {
                colour = .red
            }
        }
    }
}

// Preview for SwiftUI canvas
#Preview {
    CardDetailsView(card: Card(
        name: "Sample Card",
        marketprice: 0.00,
        imageName: "SampleImage",
        set: "N/A",
        type: "N/A",
        hp: "N/A",
        number: "N/A"
    ), cardNotion: true)
}

