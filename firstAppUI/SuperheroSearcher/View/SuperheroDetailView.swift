//
//  SuperheroDetailView.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 17-06-25.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetailView: View {
    @State var superhero: Superhero
    @State var loading = true
    var body: some View {
        VStack {
            if loading {
                ProgressView().tint(.white)
            } else {
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(height: 300)
                    .cornerRadius(24)
                    .clipped()
                Text(superhero.name.uppercased()).foregroundColor(.white)
                    .font(.title)
                    .fontDesign(.serif)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .underline()
                    .background(.buttonBack.opacity(0.2))
                    .cornerRadius(24)
            }
            HStack {
                VStack {
                    Text("Full name".uppercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.white)
                    let name = superhero.biography?.fullName.trimmingCharacters(in: .whitespacesAndNewlines)
                    Text((name?.isEmpty == false ? name!.uppercased() : "UNKNOWED"))
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .lineLimit(1)
                }.frame(maxWidth: .infinity)
                VStack {
                    Text("Gender".uppercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.white)
                    Text(superhero.appearance?.gender.uppercased() ?? "Unknowed").foregroundColor(.gray)
                        .font(.footnote)
                }.frame(maxWidth: .infinity)
                VStack {
                    Text("Alignment".uppercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.white)
                    Text(superhero.biography?.alignment.uppercased() ?? "Unknowed").foregroundColor(.gray)
                        .font(.footnote)
                }.frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
                .padding()
            SuperheroStats(stats: superhero.powerstats!)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.imcBack)
            .onAppear{
                Task {
                    do {
                        superhero = try await ApiNetwork().getSuperheroById(superhero.id)
                    } catch {
                        print("error detail")
                    }
                    loading = false
                }
            }
    }
}

struct SuperheroStats: View {
    let stats: SuperHeroPowerstats
    var body: some View {
        VStack {
            Chart {
                SectorMark(angle: .value("Count", Int(stats.combat) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Combat"))
                SectorMark(angle: .value("Count", Int(stats.strength) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Strength"))
                SectorMark(angle: .value("Count", Int(stats.durability) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Durability"))
                SectorMark(angle: .value("Count", Int(stats.power) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Power"))
                SectorMark(angle: .value("Count", Int(stats.speed) ?? 0),
                           innerRadius: .ratio(0.5),
                           angularInset: 5
                ).cornerRadius(5)
                    .foregroundStyle(by: .value("Category", "Speed"))
            }
        }.padding(24)
            .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
            .background(.white)
            .cornerRadius(24)
    }
}

