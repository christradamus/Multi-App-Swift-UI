//
//  RickAndMortySearcherView.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 23-06-25.
//

import SwiftUI
import SDWebImageSwiftUI

struct RickAndMortySearcherView: View {
    @State var characterName: String = ""
    @State var apiResponse: ApiRickAndMorty? = nil
    @State var showNoResultsAlert = false
    
    var body: some View {
        VStack {
            TextField("",
                      text: $characterName,
                      prompt:
                        Text("Ingrese nombre...")
                .font(.title2)
                .bold()
                .foregroundColor(.gray)
            )
            .font(.title2)
            .bold()
            .foregroundColor(.black)
            .padding(16)
            .border(.gray, width: 1.5)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                Task {
                    do {
                        apiResponse = try await                 ApiNetworkRyM().getCharacterByName(characterName)
                    } catch {
                        showNoResultsAlert = true
                    }
                }
            }
            NavigationStack {
                List(apiResponse?.results ?? []) { character in
                    ZStack {
                        RickAndMortyItem(character: character)
                        NavigationLink(destination: {
                            RickAndMortyDetailView(character: character)
                        }){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.white)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .alert("Sin resultados", isPresented: $showNoResultsAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("No se encontraron personajes con ese nombre.")
            }
    }
}

struct RickAndMortyItem: View {
    let character:RickAndMortyResults
    var body: some View {
        ZStack {
            WebImage(url: URL(string: character.image))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack {
                Spacer()
                Text(character.name).foregroundColor(.buttonSelected)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(20)
    }
}

