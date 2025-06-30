//
//  RickAndMortyDetailView.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 23-06-25.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct RickAndMortyDetailView: View {
    @State var character: RickAndMortyResults
    @State var loading = true
    @State var showNoResultsAlert = false

    var body: some View {
        VStack {
            if loading {
                ProgressView().tint(.black)
            } else {
                WebImage(url: URL(string: character.image))
                    .resizable()
                    .indicator(.activity)
                    .scaledToFill()
                    .frame(height: 300)
                    .cornerRadius(24)
                    .clipped()
                Text(character.name.uppercased()).foregroundColor(.black)
                    .font(.title)
                    .fontDesign(.serif)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .underline()
                    .background(.gray.opacity(0.2))
                    .cornerRadius(24)
            }
            HStack {
                VStack {
                    Text("Full name".uppercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                    let name = character.name.trimmingCharacters(in: .whitespacesAndNewlines)
                    Text((name.isEmpty == false ? name.uppercased() : "UNKNOWED"))
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .lineLimit(1)
                }.frame(maxWidth: .infinity)
                VStack {
                    Text("Gender".uppercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                    Text(character.gender.uppercased() ?? "Unknowed").foregroundColor(.gray)
                        .font(.footnote)
                }.frame(maxWidth: .infinity)
                VStack {
                    Text("Status".uppercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                    Text(character.status.uppercased() ?? "Unknowed").foregroundColor(.gray)
                        .font(.footnote)
                }.frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
                .padding()
            HStack {
                VStack {
                    Text("Episodes".uppercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                    Text(String(character.episode.count))
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .lineLimit(1)
                }.frame(maxWidth: .infinity)
                VStack {
                    Text("Species".uppercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                    Text(character.species.uppercased() ?? "Unknowed").foregroundColor(.gray)
                        .font(.footnote)
                }.frame(maxWidth: .infinity)
                VStack {
                    Text("Origin".uppercased())
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                    Text(character.origin.name.uppercased() ?? "Unknowed").foregroundColor(.gray)
                        .font(.footnote)
                }.frame(maxWidth: .infinity)
            }.frame(maxWidth: .infinity)
                .padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .onAppear{
                Task {
                    do {
                        character = try await ApiNetworkRyM().getCharacterDetailById(character.id)
                    } catch {
                        showNoResultsAlert = true
                    }
                    loading = false
                }
            }
            .alert("Error", isPresented: $showNoResultsAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Error al mostrar detalles del personaje")
            }
    }
}
