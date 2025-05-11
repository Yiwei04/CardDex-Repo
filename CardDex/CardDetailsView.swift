//
//  CardDetailsView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI
import UIKit

struct CardDetailsView: View {
    let card: Card
    @State var colour: Color = .black
    @Environment(\.dismiss) var dismiss
    @StateObject private var cardsList = CardList()
    @StateObject private var ownedCardsList = OwnedCards()
    lazy var cards = cardsList.getCardList()
    lazy var ownedCards = ownedCardsList.getOwnedCards()


    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {

                    // Back button → goes to CardsView
                    HStack {
                        Button(action: {
                            dismiss()
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

                    // Card image
                    Image(card.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)

                    // Total worth section
                    VStack(spacing: 6) {
                        Text("Total Worth")
                            .foregroundColor(.white)
                            .font(.headline)

                        Text("$"+String(card.marketprice))
                            .foregroundColor(.white)
                            .font(.system(size: 52, weight: .bold))

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
                        Text("Set: "+" Unkown")
                            .bold(true)
                        Text("Type:"+" Unkown")
                            .bold(true)
                        Text("HP:"+" Unkown")
                            .bold(true)
                        Text("Card Number:"+" Unkown/Unkown")
                            .bold(true)
                    }
                    .font(.body)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)

                    // Smaller gap before battle stats
                    Spacer().frame(height: 5)

                    // Battle stats heading and moves
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("Battle Stats ⚔️")
//                            .font(.system(size: 24, weight: .bold))
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity, alignment: .center)
//                            .padding(.bottom, 4)
//
//                        Text("Dragon Claw – 40 damage")
//                        Text("Bright Flame – 120 damage")
//                    }
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity, alignment: .leading)
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
                .padding()
            }
            .background(Color(red: 0.311, green: 0.089, blue: 0.424).ignoresSafeArea())
        }
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            if(card.valueincrease){
                colour = .green
            } else {
                colour = .red
            }
        }
    }
}

#Preview {
    CardDetailsView(card: Card(name: "Sample Card", marketprice: 0.00, imageName: "SampleImage"))
}

