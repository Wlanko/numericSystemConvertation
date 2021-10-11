//
//  LogInView.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 09.10.2021.
//

import SwiftUI
import FirebaseAuth

struct EnterPhoneNumber: View {
    @Binding var presentVerificationCodeView: Bool
    @State var phoneNumber: String = ""
    var nextText = "Next"
    var authWithPhoneNumber = AuthWithPhoneNumber()
    
    var phoneNumberText = "Phone number"
    
    var body: some View {
        VStack {
            TextFieldPattern(text: $phoneNumber, topLabel: phoneNumberText, placeholderText: phoneNumberText)
            Button(nextText) {
                presentVerificationCodeView = AuthWithPhoneNumber.passPhoneNumber(phoneNumber: phoneNumber)
            }
        }
        .sheet(isPresented: $presentVerificationCodeView, content: {
            EnterVerificationCode()
        })
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        EnterPhoneNumber(presentVerificationCodeView: .constant(false))
    }
}
