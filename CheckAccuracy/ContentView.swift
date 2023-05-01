//
//  ContentView.swift
//  CheckAccuracy
//
//  Created by Игорь Солодянкин on 01.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = Double.random(in: 0...100).rounded()
    @State private var targetValue = Double.random(in: 0...100).rounded()
    
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Пододвинь слайдер как можно ближе к: \(targetValue.formatted())")
            }
            HStack {
                Text("0")
                Slider(value: $currentValue, in: 0...100, step: 1)
                Text("100")
            }
            
            Button("Проверь меня") {
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Твой счёт"),
                    message: Text(computeScore().rounded().formatted()),
                    dismissButton: .default(Text("OK")))
            }
            
            Button("Начать заново") {
                targetValue = Double.random(in: 0...100).rounded()
                currentValue = Double.random(in: 0...100).rounded()
            }
        }
        .padding()
    }
    
    private func computeScore() -> Double {
        let difference = abs(Int(targetValue) - lround(currentValue))
        return Double(100 - difference)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
