//
//  ContentView.swift
//  Work with sliders SwiftUI
//
//  Created by Irina Moiseeva on 29.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue1 = Double.random(in: 0...255)
    @State private var newValue1: String = ""
    
    @State private var sliderValue2 = Double.random(in: 0...255)
    @State private var newValue2: String = ""
    
    
    @State private var sliderValue3 = Double.random(in: 0...255)
    @State private var newValue3: String = ""
    
    
    @State private var isEditing = false

    



    var body: some View {
        
        ZStack {
            Color(white: 0.8)
                .ignoresSafeArea()
        VStack {
 
            RectangleView(red: $sliderValue1, green: $sliderValue2, blue: $sliderValue3)

            ColorSlider(value: $sliderValue1, newNumber: $newValue1, editing: $isEditing)
                .accentColor(.red)
            ColorSlider(value: $sliderValue2, newNumber: $newValue2, editing: $isEditing)
                .accentColor(.green)
            ColorSlider(value: $sliderValue3, newNumber: $newValue3, editing: $isEditing)
                .accentColor(.blue)
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

struct RectangleView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double

    var body: some View {

        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(Color(red: red/255, green: green/255, blue: blue/255))
            .frame(width: 300, height: 100)
          //  .foregroundColor(Color(red: red, green: green, blue: blue))
          


    }
    
    
}

