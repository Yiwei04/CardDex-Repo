//
//  CardDexApp.swift
//  CardDex
//
//  Created by Jeffery Wang on 22/4/2025.
//

import SwiftUI

@main
struct CardDexApp: App {
    // Shared state object for managing the user's owned cards across the app
    @StateObject var ownedCards = OwnedCards()
    
    var body: some Scene {
        WindowGroup {
            // NavigationStack enables navigation between views
            NavigationStack {
                PokemonHomeView()
            }
            // Injects `ownedCards` into the environment so all child views can access it
            .environmentObject(ownedCards)
        }
    }
}
