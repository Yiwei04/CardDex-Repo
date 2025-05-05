//
//  PokemonAPI.swift
//  CardDex
//
//  Created by Campbell Finlay on 5/5/2025.
//

import Foundation

class PokemonAPI: ObservableObject {
    static let shared = PokemonAPI()
    private let apiKey = "4a48a8c1-acd6-44b5-95c0-5d20dece4aa3"
    private let baseURl = "https://api.pokemontcg.io/v2/cards"
    
    func fetchCards(completion: @escaping ([Card]?) -> Void) {
        guard let url = URL(string: baseURl) else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error:", error ?? "Unkown error")
                completion(nil)
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(CardListResponse.self, from: data)
                completion(decodedResponse.data)
            } catch {
                print("Decoding Error: ", error)
                completion(nil)
            }
        } .resume()
    }
}
