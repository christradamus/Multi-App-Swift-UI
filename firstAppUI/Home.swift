//
//  Home.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 11-06-25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    NavigationLink(destination: IMCView()) {
                        Circle()
                            .foregroundStyle(.yellow)
                            .overlay(content: {
                                Text("Ir")
                                    .foregroundStyle(.black).bold()
                                    .font(.largeTitle)
                            })
                    }
                    Text("IMC Calculator")
                        .font(.title).fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .fontDesign(.serif)
                }.padding(.horizontal)
                HStack {
                    Text("Superhero Finder")
                        .font(.title).fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .fontDesign(.serif)
                    NavigationLink(destination: SuperheroSearcherView(superheroName: "")) {
                        Circle()
                            .foregroundStyle(.orange)
                            .overlay(content: {
                                Text("Ir")
                                    .foregroundStyle(.black).bold()
                                    .font(.largeTitle)
                            })
                    }
                }.padding(.horizontal)
                HStack {
                    NavigationLink(destination: MapPlacesView()) {
                        Circle()
                            .foregroundStyle(.green)
                            .overlay(content: {
                                Text("Ir")
                                    .foregroundStyle(.black).bold()
                                    .font(.largeTitle)
                            })
                    }
                    Text("FAV Places")
                        .font(.title).fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .fontDesign(.serif)
                }.padding(.horizontal)
                HStack {
                    Text("Rick&Morty Finder")
                        .font(.title).fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .fontDesign(.serif)
                    NavigationLink(destination: RickAndMortySearcherView(characterName: "")) {
                        Circle()
                            .foregroundStyle(.white)
                            .overlay(content: {
                                Text("Ir")
                                    .foregroundStyle(.black).bold()
                                    .font(.largeTitle)
                            })
                    }
                }.padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.imcBack)
        }
    }
}

#Preview {
    Home()
}
