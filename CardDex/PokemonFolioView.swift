//
//  PokemonFolioView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

// View to display the user's owned Pokemon cards
struct PokemonFolioView: View {
    @Environment(\.dismiss) var dismiss //dismiss action
    @State private var ownedCards = OwnedCards() // Holds the user's owned cards
    @State private var searchText = "" // Holds the text input for the search bar
    private let cardNotion: Bool = false // Placeholder for card notion (could be used later)

    // Filter cards based on search text, returns all cards if search is empty
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
                    // Reset button to reset the owned cards list (could reload or reset filter)
                    Button(action: {
                        ownedCards = OwnedCards()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.blue)
                            .frame(width: 50, height: 50)
                            .background(Circle().fill(Color.yellow))
                            .shadow(radius: 4)
                    }
                }
                .padding()


                // Search bar allowing the user to search for cards
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

                // LazyVGrid to display the cards in a flexible grid layout
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(filteredCards) { card in
                        NavigationLink(destination: CardDetailsView(card: card, cardNotion: cardNotion)) {
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
                // Message displayed if no cards match the search
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
