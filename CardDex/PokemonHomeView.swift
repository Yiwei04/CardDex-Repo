//
//  PokemonHomeView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

// The home screen of the Pokemon card tracking app
struct PokemonHomeView: View {
    @Environment(\.dismiss) var dismiss //dismiss action
    @State var ownedCards: OwnedCards = OwnedCards() // Holds user's owned cards
    @State private var totalWorth: Double = 0.0 // Total monetary worth of owned cards
    @State var colour: Color = .black // Color used for gain percentage (changes based on value trend)

    var body: some View {
        ScrollView {
            // App logo at the top
            Image("Pokemon_Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 100)

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

            // Navigation buttons for various views + refresh
            HStack(spacing: 10) {
                // Go to All Cards view
                NavigationLink(destination: CardsView()) {
                    Text("All Cards")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color.yellow)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                }
                
                // Go to News view
                NavigationLink(destination: PokemonNewsView()) {
                    Text("News")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color.yellow)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                }
                
                // Go to My Portfolio view
                NavigationLink(destination: PokemonFolioView()) {
                    Text("My Portfolio")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color.yellow)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                }
                
                // Refresh button to reload card data and update total worth
                Button(action: {
                    refresh()
                }) {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.blue)
                        .frame(width: 50, height: 50)
                        .background(Circle().fill(Color.yellow))
                        .shadow(radius: 4)
                }
            }

            // Summary of total card value and gain stats
            VStack(spacing: 8) {
                Text("Total Worth")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))

                Text(String(format: "$%.2f", totalWorth))
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)

                HStack(spacing: 10) {
                    Text("$"+String(ownedCards.totalGain()))
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                    Text(String(format: "%.3f", ownedCards.totalGainPercentage())+"%")
                        .font(.subheadline)
                        .foregroundColor(colour)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            .padding()

            // Highlight feature: Card of the Day
            VStack {
                Text("Card of the Day")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                Text("")
                    .font(.subheadline)
                    .foregroundColor(.green)
                // Featured card image (hardcoded as Pikachu)
                Image("Pikachu")
                    .resizable()
                    .cornerRadius(12)
                    .frame(width: 275, height: 375)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(red: 79/255, green: 23/255, blue: 108/255).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
        
        // When the view appears, calculate total worth and set gain color
        .onAppear {
            totalWorth = ownedCards.totalValue()
            if(ownedCards.valuechange()){
                colour = .green
            } else {
                colour = .red
            }
        }
    }
    // Refresh function to reload data and recalculate worth
    public func refresh() {
        ownedCards = OwnedCards()
        totalWorth = ownedCards.totalValue()
    }
}

#Preview {
    PokemonHomeView()
        .environmentObject(OwnedCards()) // Provide a preview environment object
}
