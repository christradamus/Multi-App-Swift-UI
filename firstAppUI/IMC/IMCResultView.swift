//
//  IMCResultView.swift
//  firstAppUI
//
//  Created by Christian Perez flores on 16-06-25.
//

import SwiftUI

struct IMCResultView: View {
    let userWeight: Int
    let userHeight: Int
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Tu resultado")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.title)
                IMCInfoView(userWeight: userWeight,
                            userHeight: userHeight)
            }
            .background(.buttonSelected)
        }
    }
}

struct IMCInfoView: View {
    let userWeight: Int
    let userHeight: Int
    var body: some View {
        VStack(spacing: 20){
            Text("El peso del usuario es: \(userWeight) kgs.")
                .foregroundStyle(.white)
                .font(.title2)
                .padding(.horizontal, 20)
            Text("La altura del usuario es: \(userHeight) cms.")
                .foregroundStyle(.white)
                .font(.title2)
                .padding(.horizontal, 20)
            Text(String(format: "Tu IMC es: %.2f",
                        calculateIMC(height: userHeight,
                                     weight: userWeight)))
                .foregroundStyle(.white)
                .font(.system(size: 40))
                .bold()
                .padding(.horizontal, 20)
            IMCRangesTable(imc: calculateIMC(
                height: userHeight,
                weight: userWeight)
            ).padding(.horizontal, 20)
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity)
        .background(.buttonBack).cornerRadius(16)
        .padding(16)
    }

    private func calculateIMC(height: Int, weight: Int) -> Double {
        let weight = Double(weight)
        let heightInMeters = Double(height) / 100
        let result = weight / (heightInMeters * heightInMeters)
        return result
    }
}

struct IMCRangesTable: View {
    let imc: Double
    var body: some View {
        VStack {
            HStack {
                let (color, message) = calculateIMCRange(imc: imc)
                Rectangle()
                    .fill(color)
                    .overlay(
                        Text(message)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .bold()
                    )
                    .cornerRadius(8)
            }
        }.frame(height: 40)
    }
    
    private func calculateIMCRange(imc: Double) -> (Color, String) {
        switch imc {
        case ..<18.5:
            return (Color.yellow, "Rango Delgado")
        case 18.5..<24.9:
            return (Color.green, "Rango Normal")
        case 25...:
            return (Color.red, "Rango Sobrepeso")
        default:
            return (Color.green, "Normal")
        }
    }
}

#Preview {
    IMCResultView(userWeight: 15, userHeight: 150)
}
