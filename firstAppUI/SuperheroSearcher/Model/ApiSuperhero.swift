//
//  ApiSuperhero.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 17-06-25.
//

struct ApiSuperhero: Codable {
    let response: String
    let resultsFor: String?
    let results: [Superhero]
    
    enum CodingKeys: String, CodingKey {
        case response
        case resultsFor = "results-for"
        case results
    }
}
