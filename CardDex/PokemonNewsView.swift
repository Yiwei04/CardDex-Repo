//
//  PokemonNewsView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

// View that displays recent Pokémon TCG news articles
struct PokemonNewsView: View {
    @Environment(\.dismiss) var dismiss  // dismiss action

    // strings for sources
    let newsItems = [
        ["source": "ComicBook", "date": "May 3rd, 2025", "image": "News1", "headline": "The Pokemon TCG Has Officially Revealed its New Unova Card Sets"],
        ["source": "SportSkeeda", "date": "May 5th, 2025", "image": "News2", "headline": "Pokemon TCG Pocket: Best Oricorio deck guide"]
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                
                // back button
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

    

                // Search bar UI
                HStack {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                    TextField("Search for news...", text: .constant(""))
                        .foregroundColor(.black)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal)

                // Scrollable list of news articles
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(newsItems, id: \.self) { item in
                            // Each news item navigates to CardsView for now (could link to article in the future)
                            NavigationLink(destination: CardsView()) {
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    // Source name and date of the article
                                    HStack {
                                        Text(item["source"] ?? "")
                                        Spacer()
                                        Text(item["date"] ?? "")
                                    }
                                    .font(.caption)
                                    .foregroundColor(.white)

                                    // Image associated with the news article
                                    Image(item["image"] ?? "")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 180)
                                        .clipped()

                                    // Headline text for the article
                                    Text(item["headline"] ?? "")
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                }
                                .padding()
                                .background(Color.black)
                                .cornerRadius(15)
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top, 5)
                }
            }
            .padding(.top)
            .background(Color(red: 79/255, green: 23/255, blue: 108/255).ignoresSafeArea())
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    PokemonNewsView()
}
