//
//  FourTextFieldPattern.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 09.02.2022.
//

import SwiftUI

struct FourTextFieldPattern: View {
    @Binding var inputparameter: String
    @Binding var outputparameter: String
    @Binding var input: String
    @Binding var output: String
    
    var textForInputParameter: String
    var textForInput: String
    var textForOutputParameter: String
    var textForOutput: String
    
    var unremovablePrefix: String = ""
    
    var body: some View {
        HStack(alignment: .bottom) {
            TextFieldPattern(text: $inputparameter, topLabel: textForInputParameter, placeholderText: textForInputParameter, unremovablePrefix: unremovablePrefix)
                .keyboardType(.decimalPad)
            TextFieldPattern(text: $input, topLabel: textForInput, placeholderText: textForInput, unremovablePrefix: unremovablePrefix)
        }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        
        HStack(alignment: .bottom) {
            TextFieldPattern(text: $outputparameter, topLabel: textForOutputParameter, placeholderText: textForOutputParameter, unremovablePrefix: unremovablePrefix)
                .keyboardType(.decimalPad)
            TextFieldPattern(text: $output, topLabel: textForOutput, placeholderText: textForOutput, unremovablePrefix: unremovablePrefix)
        }
    }
    
}

struct FourTextFieldPattern_Previews: PreviewProvider {
    static var previews: some View {
        FourTextFieldPattern(inputparameter: .constant(""), outputparameter: .constant(""), input: .constant(""), output: .constant(""), textForInputParameter: "SomeParameter", textForInput: "SomeValue", textForOutputParameter: "SomeParameter", textForOutput: "SomeValue")
    }
}
