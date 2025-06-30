//
//  ListsExample.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 16-06-25.
//

import SwiftUI

struct Team: Identifiable {
    let id = UUID()
    let name: String
}

let bigTeams: [Team] = [
    Team(name: "Colo-Colo"),
    Team(name: "Universidad de Chile"),
    Team(name: "Universidad Católica"),
    Team(name: "Cobreloa"),
]

let smallTeams: [Team] = [
    Team(name: "Unión Española"),
    Team(name: "Audax Italiano"),
    Team(name: "Palestino"),
    Team(name: "O'Higgins"),
    Team(name: "Huachipato"),
    Team(name: "Cobresal")
]
struct ListsExample: View {
    var body: some View {
        VStack {
            List {
                Section(header: Text("Equipos grandes")) {
                    ForEach(bigTeams) { team in
                        Text(team.name)
                    }
                }
                Section(header: Text("Equipos chicos")) {
                    ForEach(smallTeams) { team in
                        Text(team.name)
                    }
                }
            }
        }
    }
}


#Preview {
    ListsExample()
}
