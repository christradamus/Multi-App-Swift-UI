//
//  Textfields.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 11-06-25.
//

import SwiftUI

struct Textfields: View {
    @State var age: String = ""
    @State var name: String = ""

    var body: some View {
        VStack(spacing: 10) {
            TextField("Ingresa tu nombre", text: $name)
                .keyboardType(.alphabet)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(20)
                .onChange(of: name) { oldValue, newValue in
                    ""
                }
            SecureField("Ingresa tu edad", text: $age)
                .keyboardType(.numberPad)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(20)
                .onChange(of: age) { oldValue, newValue in
                    ""
                }
            Text("El nombre ingresado es: \(name.uppercased())")
                .bold()
                .padding(.vertical, 5)
            Text("La edad ingresada es: \(age)")
                .bold()
                .padding(.vertical, 5)
        }.padding()
    }
}

#Preview {
    Textfields()
}
