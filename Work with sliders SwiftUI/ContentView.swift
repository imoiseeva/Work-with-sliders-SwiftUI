//
//  ContentView.swift
//  Work with sliders SwiftUI
//
//  Created by Irina Moiseeva on 29.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...255)
    @State private var newValue: String = ""
    @State private var isEditing = false

//    @State var color = Color(<#T##colorSpace: Color.RGBColorSpace##Color.RGBColorSpace#>, red: <#T##Double#>, green: <#T##Double#>, blue: <#T##Double#>, opacity: <#T##Double#>)
    var body: some View {
        ZStack {
            Color(white: 0.8)
                .ignoresSafeArea()
        
        VStack {
  
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 300, height: 100)
            .foregroundColor(.green)

            ColorSlider(value: $sliderValue, newNumber: $newValue, editing: $isEditing)
            Spacer()
        }
        .padding()
    
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    @Binding var newNumber: String
    @Binding var editing: Bool
    var body: some View {
        HStack(spacing: 8) {
            Text("\(lround(value))")
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(.red)
            TextField(
                    "0",
                     text: $newNumber
                )
            { isEditing in
                    editing == editing
                value = Double(newNumber) ?? 255
                }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 40)
        }
    }
}
