//
//  RickAndMortyResults.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 23-06-25.
//

struct RickAndMortyResults: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: RickAndMortyOrigin
    let location : RickAndMortyLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
