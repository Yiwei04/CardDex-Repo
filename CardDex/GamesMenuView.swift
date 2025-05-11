//
//  GamesMenuView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

// View that displays a menu of game options
struct GamesMenuView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle().fill(.backgroundPurple).ignoresSafeArea()
                VStack{
                    Spacer()
                    NavigationLink(destination: PokemonHomeView()) {
                        // Loads the Pokemon logo image
                        Image("Pokemon_Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                    .opacity(0.9)
                                    .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                                    .frame(width: 300, height: 120)
                            )
                    }
                    Spacer()
                    // Disabled Magic game logo with a similar background and shadow styling
                    NavigationLink(destination: EmptyView()) {
                        Image("Magic_Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray)
                                    .opacity(0.9)
                                    .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                                    .frame(width: 300, height: 120)
                            )
                    }
                    .disabled(true)
                    Spacer()
                    
                    // Disabled One Piece game logo with similar background and shadow
                    NavigationLink(destination: EmptyView()) {
                        Image("One_Piece_Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray)
                                    .opacity(0.9)
                                    .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                                    .frame(width: 300, height: 120)
                            )
                    }
                    .disabled(true)
                    Spacer()
                    
                    // Disabled Yu-Gi-Oh game logo with similar background and shadow
                    NavigationLink(destination: EmptyView()) {
                        Image("Yu-Gi-Oh_Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray)
                                    .opacity(0.9)
                                    .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                                    .frame(width: 300, height: 120)
                            )
                    }
                    .disabled(true)
                    Spacer()
                    
                    // Disabled Digimon game logo with similar background and shadow
                    NavigationLink(destination: EmptyView()) {
                        Image("Digimon_Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 100)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray)
                                    .opacity(0.9)
                                    .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                                    .frame(width: 300, height: 120)
                            )
                    }
                    .disabled(true)
                    Spacer()
                }
                .padding()
            }
        }
        // Hides the back button in the navigation bar for cleaner UI
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GamesMenuView()
}
