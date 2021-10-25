//
//  LogInView.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 09.10.2021.
//

import SwiftUI
import FirebaseAuth

@available(iOS 15.0.0, *)
struct EnterPhoneNumber: View {
    @State var phoneNumber: String = ""
    var nextText = "Next"
    @ObservedObject var authDelegat = NumericAuthUIDelegate()
    @ObservedObject var authWithPhoneNumber = AuthWithPhoneNumber()
    
    
    var phoneNumberText = "Phone number"
    
    var body: some View {
       
        VStack {
            TextFieldPattern(text: $phoneNumber, topLabel: phoneNumberText, placeholderText: phoneNumberText)
                .keyboardType(.decimalPad)
            Button(nextText) {
                authWithPhoneNumber.passPhoneNumber(phoneNumber: phoneNumber, authUIDelegate: authDelegat)
            }
        }
        .sheet(isPresented: $authWithPhoneNumber.flag, content: {
            EnterVerificationCode()
        })
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0.0, *) {
            EnterPhoneNumber()
        } else {
            // Fallback on earlier versions
        }
    }
}
