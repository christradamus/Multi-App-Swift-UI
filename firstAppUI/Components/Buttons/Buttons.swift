//
//  Buttons.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 11-06-25.
//

import SwiftUI

struct Buttons: View {
    @State var attempsButton: Int = 0

    var body: some View {
        VStack {
            Image("colocolo")
            Button {
                attempsButton += 1
            } label: {
                Text("Intentos Colo colo = \(attempsButton)")
                    .padding()
                    .bold()
                    .font(.title)
                    .frame(height: 60,
                           alignment: .center)
                    .background(.black)
                    .foregroundStyle(.white)
            }.cornerRadius(20.0)
        }
    }
}

#Preview {
    Buttons()
}
