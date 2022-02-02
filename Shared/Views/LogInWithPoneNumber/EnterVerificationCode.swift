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
    let unremovablePrefix = ""
    @State var verificationCode: String = ""
    @ObservedObject var authWithPhoneNumber = AuthWithPhoneNumber()
    var body: some View {
        NavigationView {
            ZStack {
                Image("beautifulBackgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                    .padding(.top, -32)
                
                VStack{
                    TextFieldPattern(text: $verificationCode, topLabel: textForVerificarionCodeTextField, placeholderText: textForVerificarionCodeTextField, unremovablePrefix: unremovablePrefix)
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    NavigationLink(destination: ContentView()
                                    .navigationBarTitleDisplayMode(.inline)
                                    .navigationBarHidden(true),
                                   isActive: $authWithPhoneNumber.presentMainView) { EmptyView() }
                    
                    Button("Next") {
                        authWithPhoneNumber.signInUserWithVErificationCode(verificationCode: self.verificationCode)
                    }
                    .alert(authWithPhoneNumber.errorMessage, isPresented: $authWithPhoneNumber.showErrorAlert, actions: {})
                    .padding(.bottom, 40)
                    
                }
                .padding(.top)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Log In")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
}

@available(iOS 15.0.0, *)
struct EnterVerificationCode_Previews: PreviewProvider {
    static var previews: some View {
        EnterVerificationCode()
    }
}
