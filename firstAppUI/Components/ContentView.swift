//
//  ContentView.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 09-06-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundStyle(.blue)
                Rectangle()
                    .foregroundStyle(.orange)
                Rectangle()
                    .foregroundStyle(.yellow)
            }.frame(height: 100)
                .background(.red)
                Rectangle()
                    .foregroundStyle(.orange)
                    .frame(height: 100)
            HStack {
                Circle()
                    .foregroundStyle(.green)
                Rectangle()
                Circle()
                    .foregroundStyle(.indigo)
            }.frame(height: 250)
            Rectangle()
                .foregroundStyle(.orange)
                .frame(height: 100)
            HStack {
                Rectangle()
                    .foregroundStyle(.blue)
                Rectangle()
                    .foregroundStyle(.orange)
                Rectangle()
                    .foregroundStyle(.yellow)
            }.frame(height: 100)
        }
        .background(.red)
    }
}

#Preview {
    ContentView()
}
