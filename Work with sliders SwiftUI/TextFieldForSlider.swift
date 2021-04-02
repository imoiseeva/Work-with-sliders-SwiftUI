//
//  TextField.swift
//  Work with sliders SwiftUI
//
//  Created by Irina Moiseeva on 01.04.2021.
//

import SwiftUI

struct TextFieldForSlider: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var alert = false
    
    var body: some View {
        TextField("", text: $textValue, onCommit: checkValue)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 45, alignment: .trailing)
            .alert(isPresented: $alert, content: {
                Alert(title: Text("Error"),
                      message: Text("Please, enter number from 0 to 255"))
            })
    }
}

extension TextFieldForSlider {
    private func checkValue() {
        if let _ = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        alert.toggle()
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldForSlider(textValue: .constant("80.0"), value: .constant(120.0))
    }
}
