//
//  ApiNetwork.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 17-06-25.
//

import Foundation

class ApiNetwork {
    func getSuperheroByQuery(_ query: String) async throws -> ApiSuperhero {
        guard let url = URL(
            string: "https://www.superheroapi.com/api.php/0c329a4d8099a239a2f38d3434ecc37c/search/\(query)"
        ) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ApiSuperhero.self, from: data)
        return response
    }

    func getSuperheroById(_ id: String) async throws -> Superhero {
        guard let url = URL(
            string: "https://www.superheroapi.com/api.php/0c329a4d8099a239a2f38d3434ecc37c/\(id)"
        ) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Superhero.self, from: data)
        return response
    }
}

