//
//  SuperHeroAppearance.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 18-06-25.
//

struct SuperHeroAppearance: Codable {
    let gender: String
    let race: String
    let height: [String]
    let weight: [String]
    let eyeColor: String
    let hairColor: String
    
    enum CodingKeys: String, CodingKey {
        case gender
        case race
        case height
        case weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
}
