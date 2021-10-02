//
//  TextFieldForNumericConversion.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 30.09.2021.
//

import SwiftUI

struct TextFieldForNumericConversion: View{
    @State var text: String
    var placeholderText: String = ""
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: -2.0) {
            Text(placeholderText)
                .font(.system(size: 16))
                .padding(.leading, 5)
            TextField(placeholderText, text: $text)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 1)
                )
                .padding(5)
        }
    }
}

struct TextFieldForNumericConversion_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldForNumericConversion(text: "SomeString")
    }
}