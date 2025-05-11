//
//  CardDetailsView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct CardDetailsView: View {
    let card: Card

    var body: some View {
        CardDetailsView
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {

                    // Back button → goes to CardsView
                    HStack {
                        NavigationLink(destination: CardsView()) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.yellow)
                                .font(.title2)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)

                    // Card title and rarity
                    VStack(spacing: 6) {
                        Text("Salamence ex – EX Deoxys (2005)")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)

                        Text("⭐️ Ultra Rare (EX card)")
                            .font(.subheadline)
                            .foregroundColor(.yellow)
                            .shadow(color: .black.opacity(0.8), radius: 1, x: 1, y: 1)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                    }

                    // Card image
                    Image("Salamence")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)

                    // Total worth section
                    VStack(spacing: 6) {
                        Text("Total Worth")
                            .foregroundColor(.white)
                            .font(.headline)

                        Text("$2,561.39")
                            .foregroundColor(.white)
                            .font(.system(size: 52, weight: .bold))

                        HStack(spacing: 10) {
                            Text("$45.32")
                                .foregroundColor(.green)
                                .font(.title3)

                            Text("▲ 14.63%")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .background(Color.green)
                                .cornerRadius(10)

                            Text("24H")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .background(Color.gray)
                                .cornerRadius(10)
                        }
                    }

                    // Card attributes
                    VStack(alignment: .leading, spacing: 10) {
                        Text("**Set:** EX Deoxys")
                        Text("**Type:** Dragon 🐉")
                        Text("**HP:** 160")
                        Text("**Card Number:** 102/107")
                    }
                    .font(.body)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)

                    // Smaller gap before battle stats
                    Spacer().frame(height: 5)

                    // Battle stats heading and moves
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Battle Stats ⚔️")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.bottom, 4)

                        Text("Dragon Claw – 40 damage")
                        Text("Bright Flame – 120 damage")
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            .background(Color(red: 0.311, green: 0.089, blue: 0.424).ignoresSafeArea())
        }
    }
}

#Preview {
    CardDetailsView(card: Card(name: "Sample Card", marketprice: 123.45, imageName: "SampleImage"))
}

