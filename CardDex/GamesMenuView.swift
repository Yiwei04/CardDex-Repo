//
//  GamesMenuView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct GamesMenuView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle().fill(.backgroundPurple).ignoresSafeArea()
                VStack{
                    Spacer()
                    NavigationLink(destination: PokemonHomeView()) {
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GamesMenuView()
}
