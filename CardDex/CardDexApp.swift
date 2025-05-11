//
//  CardDexApp.swift
//  CardDex
//
//  Created by Jeffery Wang on 22/4/2025.
//

import SwiftUI

@main
struct CardDexApp: App {
    @StateObject var ownedCards = OwnedCards()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                PokemonHomeView()
            }
            .environmentObject(ownedCards)
        }
    }
}
