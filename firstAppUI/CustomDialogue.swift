//
//  CustomDialogue.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 23-06-25.
//

import SwiftUI

struct CustomDialogue<Content:View>: View {
    
    let closeDialogue:() -> Void
    let onDismissOutside:Bool
    let content: Content
    
    var body: some View {
        ZStack{
            Rectangle().fill(.gray.opacity(0.7))
                .ignoresSafeArea()
                .onTapGesture {
                    if onDismissOutside {
                        withAnimation{
                            closeDialogue()
                        }
                    }
                }
            content
                .frame(width: UIScreen.main.bounds.width-100,
                       height: 200)
                .padding()
                .background(.white.opacity(0.8))
                .cornerRadius(16)
                .overlay(alignment: .topTrailing){
                    Button(action: {
                        withAnimation{
                            closeDialogue()
                        }
                    }, label: {
                        Image(systemName: "xmark.circle")
                    }).foregroundStyle(.blue).padding(16)
                }
        }.ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.height,
                   alignment: .center)
    }
}
