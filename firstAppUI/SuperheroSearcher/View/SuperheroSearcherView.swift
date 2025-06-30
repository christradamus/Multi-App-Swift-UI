//
//  SuperheroSearcherView.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 16-06-25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearcherView: View {
    @State var superheroName: String = ""
    @State var apiResponse: ApiSuperhero? = nil
    var body: some View {
        VStack {
            TextField("",
                      text: $superheroName,
                      prompt:
                        Text("Ingrese nombre...")
                .font(.title2)
                .bold()
                .foregroundColor(.gray)
            )
            .font(.title2)
            .bold()
            .foregroundColor(.white)
            .padding(16)
            .border(.purple, width: 1.5)
            .padding(8)
            .autocorrectionDisabled()
            .onSubmit {
                Task {
                    do {
                        apiResponse = try await                 ApiNetwork().getSuperheroByQuery(superheroName)
                    } catch {
                        print("ERROR DE INFO.")
                    }
                }
            }
            NavigationStack {
                List(apiResponse?.results ?? []) { hero in
                    ZStack {
                        SuperheroItem(superhero: hero)
                        NavigationLink(destination: {
                            SuperheroDetailView(superhero: hero)
                        }){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.imcBack)
                }.listStyle(.plain)
            }
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.imcBack)
    }
}

struct SuperheroItem: View {
    let superhero:Superhero
    var body: some View {
        ZStack {
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            VStack {
                Spacer()
                Text(superhero.name).foregroundColor(.buttonSelected)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(20)
    }
}

