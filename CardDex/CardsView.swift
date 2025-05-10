//
//  CardsView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct CardsView: View {
    @Environment(\.dismiss) var dismiss  // lets us go back
    
    var body: some View {
        ScrollView{
            VStack{
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
                    NavigationLink(destination: CardsView()) {
                        Text("All Cards")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color.yellow)
                            .foregroundColor(.blue)
                            .cornerRadius(20)
                    }
                    
                    NavigationLink(destination: PokemonFolioView()) {
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
                // search bar
                HStack {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                    TextField("Search for card...", text: .constant(""))
                        .foregroundColor(.black)
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal)
            }
        }
        .padding()
        .background(Color(red: 79/255, green: 23/255, blue: 108/255).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    CardsView()
}
