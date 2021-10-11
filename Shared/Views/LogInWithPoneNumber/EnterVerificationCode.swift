//
//  EnterVerificationCode.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 10.10.2021.
//

import SwiftUI

struct EnterVerificationCode: View {
    var textForVerificarionCodeTextField: String = "Verification code"
    @State var verificationCode: String = ""
    
    var body: some View {
        TextFieldPattern(text: $verificationCode, topLabel: textForVerificarionCodeTextField, placeholderText: textForVerificarionCodeTextField)
    }
}

struct EnterVerificationCode_Previews: PreviewProvider {
    static var previews: some View {
        EnterVerificationCode()
    }
}
