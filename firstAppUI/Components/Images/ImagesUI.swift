//
//  ImagesUI.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 09-06-25.
//

import SwiftUI

struct ImagesUI: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0){
                Rectangle()
                    .foregroundStyle(.yellow)
                Rectangle()
                    .foregroundStyle(.red)
            }.padding(.vertical, 5)
            HStack(spacing: 10) {
                Rectangle()
                    .foregroundStyle(.red)
                Image("apple-icon")
                    .resizable()
                    .frame(width: 100, height: 100)
                Image(systemName: "figure.badminton.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundStyle(.yellow)
            }.padding(.vertical, 5)
            HStack(spacing: 0){
                Rectangle()
                    .foregroundStyle(.green)
                Rectangle()
                    .foregroundStyle(.blue)
            }.padding(.vertical, 5)
            HStack(spacing: 10) {
                Rectangle()
                    .foregroundStyle(.blue)
                Image("apple-icon")
                    .resizable()
                    .frame(width:150, height: 150)
                Image(systemName: "figure.badminton.circle")
                    .resizable()
                    .frame(width: 150, height: 150)
                Rectangle()
                    .foregroundStyle(.green)
            }.padding(.vertical, 5)
            HStack(spacing: 0){
                Rectangle()
                    .foregroundStyle(.mint)
                Rectangle()
                    .foregroundStyle(.orange)
            }.padding(.vertical, 5)
        }.frame(height: 600)
    }
}

#Preview {
    ImagesUI()
}
