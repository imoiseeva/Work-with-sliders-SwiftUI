//
//  ContentView.swift
//  Work with sliders SwiftUI
//
//  Created by Irina Moiseeva on 29.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue1 = Double.random(in: 0...255)
    @State private var sliderValue2 = Double.random(in: 0...255)
    @State private var sliderValue3 = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(white: 0.8)
                .ignoresSafeArea()
            VStack {
                RectangleView(red: $sliderValue1,
                              green: $sliderValue2,
                              blue: $sliderValue3)
                
                ColorSlider(value: $sliderValue1, color: .red)
                ColorSlider(value: $sliderValue2, color: .green)
                ColorSlider(value: $sliderValue3, color: .blue)
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

struct RectangleView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(Color(red: red/255, green: green/255, blue: blue/255))
            .frame(width: 300, height: 100)
    }
}



