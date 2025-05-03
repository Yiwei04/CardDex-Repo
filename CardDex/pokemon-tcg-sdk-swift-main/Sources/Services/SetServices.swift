//
//  File.swift
//  PokemonTCGSDKSwift
//
//  Created by Bilel BOURICHA on 28/12/2024.
//

import Foundation

public class SetServices {
    private let networkManager: NetworkManager

    public init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    public func findSet(by id: String) async throws -> PokemonSet {
        let endpoint = Endpoint(path: "sets/\(id)")
        return try await networkManager.request(endpoint: endpoint)
    }

    public func searchSet(query: String) async throws -> SetResponse {
        let endpoint = Endpoint(path: "sets", parameters: ["q":query])
        return try await networkManager.request(endpoint: endpoint)
    }

    public func allSets() async throws -> SetResponse {
        let endpoint = Endpoint(path: "sets")
        return try await networkManager.request(endpoint: endpoint)
    }
}
