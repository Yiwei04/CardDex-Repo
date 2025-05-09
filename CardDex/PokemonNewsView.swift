//
//  PokemonNewsView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct PokemonNewsView: View {
    @Environment(\.dismiss) var dismiss  // lets us go back

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

                // yellow buttons
                HStack(spacing: 10) {
                    Text("All Cards")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color.yellow)
                        .foregroundColor(.blue)
                        .cornerRadius(20)

                    Text("News")
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color.yellow)
                        .foregroundColor(.blue)
                        .cornerRadius(20)

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

                // search bar
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

                // list of news
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(newsItems, id: \.self) { item in
                            NavigationLink(destination: CardsView()) {
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    // name of source and date
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
                        }
                    }
                    .padding(.top, 5)
                }
            }
            .padding(.top)
            .background(Color(red: 79/255, green: 23/255, blue: 108/255).ignoresSafeArea())
        }
    }
}

#Preview {
    PokemonNewsView()
}
