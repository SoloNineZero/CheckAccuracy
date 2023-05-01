//
//  UISliderRepresentation.swift
//  CheckAccuracy
//
//  Created by Игорь Солодянкин on 01.05.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var value: Double
    
    let thumbAlpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue(_:)),
            for: .valueChanged
        )
                
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = .red.withAlphaComponent(CGFloat(thumbAlpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

// MARK: - Coordinator
extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changeValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct UISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(value: .constant(50), thumbAlpha: 100)
    }
}
