//
//  pokecom_tcg_sdk_swiftTests.swift
//  pokecom-tcg-sdk-swiftTests
//
//  Created by Bilel BOURICHA on 26/12/2024.
//

import Testing
@testable import PokemonTCGSDKSwift

struct CardServiceTests {

    @Test
    func testFetchCard_Success() async throws {
        // Simuler une réponse JSON pour une carte
        let jsonResponse = """
        {
            "id": "xy1-1",
            "name": "Venusaur",
            "supertype": "Pokémon",
            "hp": "160"
        }
        """
        let mockData = jsonResponse.data(using: .utf8)

        // Créer une instance de MockNetworkManager
        let mockManager = MockNetworkManager(response: mockData, error: nil)

        // Injecter le mock dans CardService
        let service = CardServices(networkManager: mockManager)


        let card = try await service.findCard(by: "xy1-1")

        print(card.id)
        #expect(card.id == "xy1-1")
        #expect(card.name == "Venusaur")
        #expect(card.supertype == "Pokémon")
        #expect(card.hp == "160")
    }
}
