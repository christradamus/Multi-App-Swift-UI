//
//  ApiRickAndMorty.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 23-06-25.
//

struct ApiRickAndMorty: Codable {
    let info: RickAndMortyInfo
    let results: [RickAndMortyResults]
}
