//
//  PokemonHomeView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct PokemonHomeView: View {
    @Environment(\.dismiss) var dismiss
    @State var ownedCards: OwnedCards = OwnedCards()
    @State private var totalWorth: Double = 0.0
    @State var colour: Color = .black

    var body: some View {
        ScrollView {
            Image("Pokemon_Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 100)

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

            HStack(spacing: 10) {
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

            VStack {
                Text("Card of the Day")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                Text("")
                    .font(.subheadline)
                    .foregroundColor(.green)
                Image("Pikachu")
                    .resizable()
                    .cornerRadius(12)
                    .frame(width: 220, height: 300)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(red: 79/255, green: 23/255, blue: 108/255).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(true)
        .onAppear {
            totalWorth = ownedCards.totalValue()
            if(ownedCards.valuechange()){
                colour = .green
            } else {
                colour = .red
            }
        }
    }
    public func refresh() {
        ownedCards = OwnedCards()
        totalWorth = ownedCards.totalValue()
    }
}

#Preview {
    PokemonHomeView()
        .environmentObject(OwnedCards())
}
