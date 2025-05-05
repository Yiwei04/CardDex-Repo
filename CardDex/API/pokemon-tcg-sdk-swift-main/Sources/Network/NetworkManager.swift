//
//  NetworkManager.swift
//  pokecom-tcg-sdk-swift
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Foundation

public class NetworkManager {
    private let session: URLSession
    private let apiKey: String

    public init(apiKey: String, session: URLSession = .shared) {
        self.apiKey = apiKey
        self.session = session
    }

    public func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        guard let url = endpoint.url else {
            throw APIError.unknown
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")

        do {
            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }

            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                return decodedResponse
            } catch {
                throw APIError.decodingError(error)
            }
        } catch {
            throw APIError.networkError(error)
        }
    }
}
