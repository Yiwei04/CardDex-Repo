//
//  MockNetworkManager.swift
//  pokecom-tcg-sdk-swiftTests
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

class MockNetworkManager: NetworkManager {
    private let response: Data?
    private let error: Error?

    init(response: Data?, error: Error?) {
        self.response = response
        self.error = error
        super.init(apiKey: "mock_api_key")
    }

    override func request<T>(endpoint: Endpoint) async throws -> T where T : Decodable {
        if let error {
            throw APIError.networkError(error)
        } else if let response = response {
            do {
                let decoded = try JSONDecoder().decode(T.self, from: response)
                return decoded
            } catch {
                throw APIError.decodingError(error)
            }
        }
        throw APIError.unknown
    }
}
