//
//  SuperHero.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 17-06-25.
//

struct Superhero: Codable, Identifiable {
    let id: String
    let name: String
    let powerstats: SuperHeroPowerstats?
    let biography: SuperHeroBiography?
    let appearance: SuperHeroAppearance?
    let work: SuperHeroWork?
    let connections: SuperHeroConnections?
    let image: SuperHeroImage
}
