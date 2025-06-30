//
//  SuperHeroConnections.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 18-06-25.
//

struct SuperHeroConnections: Codable {
    let groupAffiliation: String
    let relatives: String
    
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
}
