//
//  Texts.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 09-06-25.
//

import SwiftUI

struct Texts: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.orange
                //.ignoresSafeArea()
                HStack {
                    Circle().frame(height: 100)
                    Circle().frame(height: 100)
                    Circle().frame(height: 100)
                }
            }
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Text("Custom text")
                        .font(.system(size: 50, weight: .black, design: .serif))
                        .foregroundStyle(.orange)
                        .background(.black)
                }
            }
            .frame(height: 200)
            ZStack {
                Color.orange
                    .ignoresSafeArea()
                VStack {
                    Text("Swift UI")
                        .font(.system(size: 50, weight: .black, design: .serif))
                        .foregroundStyle(.black)
                        .background(.orange)
                }
            }
            ZStack {
                Color.black
                //.ignoresSafeArea()
                HStack {
                    Circle().frame(height: 100).foregroundStyle(.orange)
                    Circle().frame(height: 100).foregroundStyle(.orange)
                    Circle().frame(height: 100).foregroundStyle(.orange)
                }
            }
            .frame(height: 200)
        }
    }
}

#Preview {
    Texts()
}
