//
//  IMCView.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 11-06-25.
//

import SwiftUI

struct IMCView: View {
    
    @State var gender: Int = 0
    @State var height: Double = 150
    @State var age: Int = 10
    @State var weight: Int = 50
    
    var body: some View {
        NavigationView {
            VStack {
                Text("IMC Calculator")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.title)
                HStack(spacing: 10) {
                    ButtonOptions(sexText: "Men",
                                  imageName: "sun.min.fill",
                                  gender: 0,
                                  selectedGender: $gender)
                    ButtonOptions(sexText: "Women",
                                  imageName: "sun.min",
                                  gender: 1,
                                  selectedGender: $gender)
                }
                HeightSlider(selectedHeight: $height)
                HStack {
                    AgeAndWeightData(title: "Age", number: $age)
                    AgeAndWeightData(title: "Weight", number: $weight)
                }
                CalculateButton(height: height,
                                weight: weight)
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .background(.imcBack)
        }
    }
}

struct ButtonOptions: View {
    let sexText: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        let color = if (gender == selectedGender) {
            Color.buttonSelected
        } else {
            Color.buttonBack
        }
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundStyle(.white)
                    .padding(.vertical)
                TextInfo(text: sexText)
                    .padding(.vertical)
            }.frame(maxWidth: .infinity,
                    maxHeight: .infinity)
            .background(color)
            .cornerRadius(5)
        }
    }
}

struct HeightSlider: View {
    @Binding var selectedHeight: Double
    var body: some View {
        VStack {
            TitleInfo(text: "Height: ")
                .padding(.top, 16)
            TextInfo(text: "\(Int(selectedHeight)) cms")
            Slider(value: $selectedHeight,
                   in: 100...220,
                   step: 1)
            .accentColor(.purple)
            .padding(.all, 20)
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity)
        .background(.buttonBack)
        .cornerRadius(5)
    }
}

struct AgeAndWeightData: View {
    let title: String
    @Binding var number: Int

    var body: some View {
        VStack {
            TitleInfo(text: title)
                .padding(.top, 16)
            TextInfo(text: String(number))
            HStack(spacing: 20) {
                Button(action: {
                    if(number > 0){
                        number -= 1
                    }
                }) {
                    Circle()
                        .overlay(content: {
                            Image(systemName: "minus")
                                .resizable()
                                .foregroundStyle(.white)
                                .scaledToFit()
                                .padding(.all, 20)
                        })
                        .foregroundStyle(.purple)
                        .frame(width: 80, height: 80)
                        .padding(.vertical, 20)
                }
                Button(action: {
                    if(number < 100){
                        number += 1
                    }
                }) {
                    Circle()
                        .overlay(content: {
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundStyle(.white)
                                .scaledToFit()
                                .padding(.all, 20)
                        })
                        .foregroundStyle(.purple)
                        .frame(width: 80, height: 80)
                        .padding(.vertical, 20)
                }
            }
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity)
        .background(.buttonBack)
        .cornerRadius(5)
    }
}

struct CalculateButton: View {
    var height: Double
    var weight: Int
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {
                IMCResultView(userWeight: weight,
                              userHeight: Int(height))
            }) {
                Text("Calculate")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.purple)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(.buttonBack)
            }
        }.padding(.bottom)
    }
}

struct TextInfo: View {
    let text: String
    var body: some View {
        Text(text).font(.largeTitle.bold()).foregroundStyle(.white)
    }
}

struct TitleInfo: View {
    let text: String
    var body: some View {
        Text(text).font(.title2).foregroundStyle(.gray)
    }
}


#Preview {
    IMCView()
}
