//
//  TextFieldForNumericConversion.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 30.09.2021.
//

import SwiftUI

struct TextFieldPattern: View{
    @Binding var text: String
    var topLabel: String
    var placeholderText: String
    let unremovablePrefix: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: -2.0) {
            Text(topLabel)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding(.leading, 5)
                //.glowBorder(color: .white, lineWidth: 3)
            TextField("", text: $text)
                .foregroundColor(.white)
                .padding(4)
                .placeholder(when: text.isEmpty) {
                       Text(placeholderText)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .padding(.leading, 5)
               }
                //.changeTextFieldForegroundColor(color: .black)
                //.glowBorder(color: .white, lineWidth: 3)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(5)
                .onChange(of: text) { newValue in
                        if !newValue.hasPrefix(unremovablePrefix) {
                            text = unremovablePrefix + self.text
                            self.text = text
                        }
                    }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct TextFieldForNumericConversion_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPattern(text: .constant(""), topLabel: "Test", placeholderText: "Test1", unremovablePrefix: "")
    }
}
