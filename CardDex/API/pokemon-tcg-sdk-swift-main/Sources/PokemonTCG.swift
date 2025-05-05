//
//  PokemonTCG.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

public class PokemonTCG {
    public let cardService: CardServices
    public let setService: SetServices

    public init(apiKey: String) {
        let networkManager = NetworkManager(apiKey: apiKey)
        self.cardService = CardServices(networkManager: networkManager)
        self.setService = SetServices(networkManager: networkManager)
    }
}
