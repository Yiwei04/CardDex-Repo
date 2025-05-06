//
//  GamesMenuView.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import SwiftUI

struct GamesMenuView: View {
    var body: some View {
        ZStack{
            Rectangle().fill(.blue).ignoresSafeArea()
            VStack{
                Spacer()
                NavigationLink(destination: PokemonHomeView()) {
                    //Image() Pokemon Logo
                    Text("Pokemon")
                        .font(.headline)
                        .foregroundStyle(.purple)
                        .frame(width: 300, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .opacity(0.9)
                                .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                        )
                }
                Spacer()
                NavigationLink(destination: EmptyView()) {
                    //Image() Game Logo
                    Text("Enter")
                        .font(.headline)
                        .foregroundStyle(.purple)
                        .frame(width: 300, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .opacity(0.9)
                                .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                        )
                }
                Spacer()
                NavigationLink(destination: EmptyView()) {
                    //Image() Game Logo
                    Text("Enter")
                        .font(.headline)
                        .foregroundStyle(.purple)
                        .frame(width: 300, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .opacity(0.9)
                                .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                        )
                }
                Spacer()
                NavigationLink(destination: EmptyView()) {
                    //Image() Game Logo
                    Text("Enter")
                        .font(.headline)
                        .foregroundStyle(.purple)
                        .frame(width: 300, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .opacity(0.9)
                                .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                        )
                }
                Spacer()
                NavigationLink(destination: EmptyView()) {
                    //Image() Game Logo
                    Text("Enter")
                        .font(.headline)
                        .foregroundStyle(.purple)
                        .frame(width: 300, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .opacity(0.9)
                                .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                        )
                }
                Spacer()
                NavigationLink(destination: EmptyView()) {
                    //Image() Game Logo
                    Text("Enter")
                        .font(.headline)
                        .foregroundStyle(.purple)
                        .frame(width: 300, height: 70)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .opacity(0.9)
                                .shadow(color: .gray.opacity(1), radius: 5, x: 0, y: 2)
                        )
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    GamesMenuView()
}
