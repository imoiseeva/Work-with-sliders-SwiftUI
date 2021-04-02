//
//  Sliders.swift
//  Work with sliders SwiftUI
//
//  Created by Irina Moiseeva on 29.03.2021.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var value: Double
    @State var newNumber: String = ""
    let color: Color
    
    var body: some View {
        
        HStack(spacing: 8) {
            Text("\(lround(value))")
            Slider(value: $value, in: 0...255)
                .accentColor(color)
                .onChange(of: value, perform: { _ in
                    newNumber = "\(lround(value))"
                })
            TextFieldForSlider(textValue: $newNumber, value: $value)
        }
        .onAppear() {
            newNumber = "\(lround(value))"
        }
    }
}

