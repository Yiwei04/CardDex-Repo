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
        ["source": "ComicBook", "link": "https://comicbook.com/gaming/news/pokemon-tcg-cards-unova-set-black-bolt-white-flare/", "date": "May 3rd, 2025", "image": "News1", "headline": "The Pokemon TCG Has Officially Revealed its New Unova Card Sets"],
        ["source": "SportSkeeda", "link":"https://www.sportskeeda.com/pokemon/pokemon-tcg-pocket-best-oricorio-deck-guide","date": "May 5th, 2025", "image": "News2", "headline": "Pokemon TCG Pocket: Best Oricorio deck guide"]
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
                            if let url = URL(string: item["link"] ?? "") {
                              //Links to the external article (Doesn't always work)
                                Link(destination: url) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        // Source name and date of the article
                                        HStack {
                                            Text(item["source"] ?? "")
                                            Spacer()
                                            Text(item["date"] ?? "")
                                        }
                                        .font(.caption)
                                        .foregroundColor(.white)
                                        
                                        //  image
                                        Image(item["image"] ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: 180)
                                            .clipped()
                                        
                                        // the headline for the news
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
                            } else {
                                Text("Invalid URL")
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
