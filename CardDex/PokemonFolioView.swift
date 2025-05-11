//
//  PokemonFolioView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct PokemonFolioView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var ownedCards = OwnedCards()
    @State private var searchText = ""

    var filteredCards: [Card] {
        if searchText.isEmpty {
            return ownedCards.getOwnedCards()
        } else {
            return ownedCards.getOwnedCards().filter { $0.name.localizedCaseInsensitiveContains(searchText) }
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
                .padding(.horizontal)

                // Yellow nav buttons
                HStack {
                    // Replaced NavigationLink with non-clickable label
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

                    Text("My Portfolio")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color.yellow.opacity(0.6))
                        .foregroundColor(.gray)
                        .cornerRadius(20)
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

                // Title
                Text("Currently Owned Cards")
                    .font(.title3)
                    .foregroundColor(.white)

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
                if(filteredCards.isEmpty){
                    Text("Go Collect Some Cards!")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }
        }
        .onAppear {
            
        }
        .padding()
        .background(Color(red: 79/255, green: 23/255, blue: 108/255).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PokemonFolioView()
}
