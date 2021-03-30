//
//  Sliders.swift
//  Work with sliders SwiftUI
//
//  Created by Irina Moiseeva on 29.03.2021.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double
    @Binding var newNumber: String
    @Binding var editing: Bool
    
    var body: some View {
        
        HStack(spacing: 8) {
            Text("\(lround(value))")
            Slider(value: $value, in: 0...255, step: 1)
            TextField(
                "0",
                text: $newNumber
            )
            { isEditing in
                editing == editing
                value = Double(newNumber) ?? 255
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 45)
        }
    }
}
