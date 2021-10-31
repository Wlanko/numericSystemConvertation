//
//  EnterVerificationCode.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 10.10.2021.
//

import SwiftUI

@available(iOS 15.0.0, *)
struct EnterVerificationCode: View {
    var textForVerificarionCodeTextField: String = "Verification code"
    @State var verificationCode: String = ""
    @ObservedObject var authWithPhoneNumber = AuthWithPhoneNumber()
    var body: some View {
        NavigationView {
            VStack{
                TextFieldPattern(text: $verificationCode, topLabel: textForVerificarionCodeTextField, placeholderText: textForVerificarionCodeTextField)
                
                Spacer()
                
                NavigationLink(destination: ContentView()
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationBarHidden(true),
                               isActive: $authWithPhoneNumber.presentMainView) { EmptyView() }
                
                Button("Next") {
                    authWithPhoneNumber.signInUserWithVErificationCode(verificationCode: self.verificationCode)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

@available(iOS 15.0.0, *)
struct EnterVerificationCode_Previews: PreviewProvider {
    static var previews: some View {
        EnterVerificationCode()
    }
}
