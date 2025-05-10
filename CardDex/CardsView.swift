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
            VStack{
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
                .padding(.horizontal)

                // Yellow buttons
                HStack{
                    NavigationLink(destination: CardsView()) {
                        Text("All Cards")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color.yellow)
                            .foregroundColor(.blue)
                            .cornerRadius(20)
                    }

                    NavigationLink(destination: PokemonNewsView()) {
                        Text("News")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color.yellow)
                            .foregroundColor(.blue)
                            .cornerRadius(20)
                    }

                    NavigationLink(destination: PokemonFolioView()) {
                        Text("My Portfolio")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color.yellow)
                            .foregroundColor(.blue)
                            .cornerRadius(20)
                    }
                }
                .padding(.bottom)

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

                // Popular Now
                Text("Popular Now")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.leading)

                // Grid of Cards
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(filteredCards) { card in
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
                .padding()
            }
        }
        .onAppear {
            loadCards()
        }
        .padding()
        .background(Color(red: 79/255, green: 23/255, blue: 108/255).edgesIgnoringSafeArea(.all))
    }

    private func loadCards() {
        if cardList.cardList.isEmpty {
            cardList.addCard(card: Card(name: "Salamence ex #187", marketprice: 150.85, imageName: "Salamence"))
            cardList.addCard(card: Card(name: "Fuecoco #201", marketprice: 35.08, imageName: "Fuecoco"))
            cardList.addCard(card: Card(name: "Espathra #010", marketprice: 2.73, imageName: "Espathra"))
            cardList.addCard(card: Card(name: "Dondozo #207", marketprice: 14.11, imageName: "Dondozo"))
            cardList.addCard(card: Card(name: "Pikachu ex #063", marketprice: 4.51, imageName: "Pikachu"))
            cardList.addCard(card: Card(name: "Charizard #004", marketprice: 447.82, imageName: "Charizard"))
            cardList.addCard(card: Card(name: "Mewtwo GX #078", marketprice: 429.19, imageName: "Mewtwo"))
            cardList.addCard(card: Card(name: "Umbreon VMax #215", marketprice: 1950.38, imageName: "Umbreon"))
            cardList.addCard(card: Card(name: "Lucario #174", marketprice: 14.54, imageName: "Lucario"))
            cardList.addCard(card: Card(name: "Gengar VMax #271", marketprice: 30.0, imageName: "Gengar"))
        }
    }
}

#Preview {
    CardsView()
}
