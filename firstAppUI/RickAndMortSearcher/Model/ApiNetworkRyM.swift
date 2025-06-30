//
//  ApiNetworkRyM.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 23-06-25.
//

import Foundation

class ApiNetworkRyM {
    func getCharacterByName(_ query: String) async throws -> ApiRickAndMorty {
        guard let url = URL(
            string: "https://rickandmortyapi.com/api/character/?name=\(query)"
        ) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ApiRickAndMorty.self, from: data)
        return response
    }

    func getCharacterDetailById(_ id: Int) async throws -> RickAndMortyResults {
        guard let url = URL(
            string: "https://rickandmortyapi.com/api/character/\(id)"
        ) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(RickAndMortyResults.self, from: data)
        return response
    }
}
