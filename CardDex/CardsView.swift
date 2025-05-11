//
//  CardsView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct CardsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var cardList = CardList()
    @State private var searchText = ""

    var filteredCards: [Card] {
        if searchText.isEmpty {
            return cardList.getCardList()
        } else {
            return cardList.getCardList().filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        ScrollView {
            VStack {
                // Back button
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
                .padding()

                // Search bar
                HStack {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                    TextField("Search for card...", text: $searchText)
                        .foregroundColor(.black)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal)

                // Title
                Text("Popular Now")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.leading)

                // Grid of Cards
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(filteredCards) { card in
                        NavigationLink(destination: CardDetailsView(card: card)) {
                            VStack {
                                Image(card.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 160)
                                    .cornerRadius(10)
                                Text(card.name)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            loadCards()
        }
        .padding()
        .background(Color(red: 79/255, green: 23/255, blue: 108/255).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
    }

    private func loadCards() {
        if cardList.cardList.isEmpty {
            cardList.addCard(card: Card(
                name: "Salamence ex #187",
                marketprice: 150.85,
                imageName: "Salamence",
                set: "Journey Together",
                type: "Dragon",
                hp: "320",
                number: "187/159"
            ))
            cardList.addCard(card: Card(
                name: "Fuecoco #201",
                marketprice: 35.08,
                imageName: "Fuecoco",
                set: "Paldea Evolved",
                type: "Fire",
                hp: "90",
                number: "201/193"
            ))
            cardList.addCard(card: Card(
                name: "Espathra #010",
                marketprice: 2.73,
                imageName: "Espathra",
                set: "Scarlet and Violet Promo",
                type: "Psychic",
                hp: "110",
                number: "010"
            ))
            cardList.addCard(card: Card(
                name: "Dondozo #207",
                marketprice: 14.11,
                imageName: "Dondozo",
                set: "Scarlet and Violet Base",
                type: "Water",
                hp: "160",
                number: "207/198"
            ))
            cardList.addCard(card: Card(
                name: "Pikachu ex #063",
                marketprice: 4.51,
                imageName: "Pikachu",
                set: "Paldea Evolved",
                type: "Electric",
                hp: "190",
                number: "063/193"
            ))
            cardList.addCard(card: Card(
                name: "Charizard #004",
                marketprice: 447.82,
                imageName: "Charizard",
                set: "Base Set",
                type: "Fire",
                hp: "120",
                number: "004/102"
                ))
            cardList.addCard(card: Card(
                name: "Mewtwo GX #078",
                marketprice: 429.19,
                imageName: "Mewtwo",
                set: "Shining Legends",
                type: "Psychic",
                hp: "190",
                number: "078/073"
            ))
            cardList.addCard(card: Card(
                name: "Umbreon VMax #215",
                marketprice: 1950.38,
                imageName: "Umbreon",
                set: "Evolving Skies",
                type: "Dark",
                hp: "310",
                number: "215/203"
            ))
            cardList.addCard(card: Card(
                name: "Lucario #174",
                marketprice: 14.54,
                imageName: "Lucario",
                set: "Paldean Fates",
                type: "Fighting",
                hp: "130",
                number: "174/091"
            ))
            cardList.addCard(card: Card(
                name: "Gengar VMax #271",
                marketprice: 841.34,
                imageName: "Gengar",
                set: "Fusion Strike",
                type: "Dark",
                hp: "320",
                number: "271/264"
            ))
        }
    }
}

#Preview {
    NavigationStack {
        CardsView()
    }
}
