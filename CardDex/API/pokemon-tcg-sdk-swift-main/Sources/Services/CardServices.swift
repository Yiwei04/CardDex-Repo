//
//  CardService.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

public class CardServices {
    private let networkManager: NetworkManager

    public init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    public func findCard(by id: String) async throws -> PokemonCard {
        let endpoint = Endpoint(path: "cards/\(id)")
        return try await networkManager.request(endpoint: endpoint)
    }

    public func searchCard(query: String, currentPage: Int?, pageSize: Int?) async throws -> PokemonCardResponse {
        var parameters = ["q":query]

        if let currentPage, let pageSize {
            parameters["page"] = "\(currentPage)"
            parameters["pageSize"] = "\(pageSize)"
        }

        let endpoint = Endpoint(path: "cards", parameters: parameters)
        return try await networkManager.request(endpoint: endpoint)
    }
}
