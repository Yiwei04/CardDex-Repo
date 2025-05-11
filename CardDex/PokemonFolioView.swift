//
//  PokemonFolioView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct PokemonFolioView: View {
    @Environment(\.dismiss) var dismiss
    @State private var ownedCards = OwnedCards()
    @State private var searchText = ""
    private let cardNotion: Bool = false

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
