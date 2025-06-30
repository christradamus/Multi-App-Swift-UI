//
//  Labels.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 11-06-25.
//

import SwiftUI

struct Labels: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 20, height: 20)
            Label("AVIONCITO",
                  systemImage: "airplane")
            Circle()
                .frame(width: 20, height: 20)
            
        }
        HStack {
            Circle()
                .frame(width: 20, height: 20)
            Label(title: { Text("Colo Colo")},
                  icon: { Image("colocolo")
                    .resizable()
                    .frame(width: 100, height: 100)
            })
            Circle()
                .frame(width: 20, height: 20)

        }
    }
}

#Preview {
    Labels()
}
