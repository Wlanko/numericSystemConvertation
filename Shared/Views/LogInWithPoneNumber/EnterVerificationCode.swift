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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack{
                TextFieldPattern(text: $verificationCode, topLabel: textForVerificarionCodeTextField, placeholderText: textForVerificarionCodeTextField, unremovablePrefix: unremovablePrefix)
                    .keyboardType(.decimalPad)
                    .padding(.top, 10)
                
                
                NavigationLink(destination: ContentView()
                                .navigationBarTitleDisplayMode(.inline)
                                .navigationBarHidden(true),
                               isActive: $authWithPhoneNumber.presentMainView) { EmptyView() }
                
                Button("Next") {
                    authWithPhoneNumber.signInUserWithVErificationCode(verificationCode: self.verificationCode)
                }
                .alert(authWithPhoneNumber.errorMessage, isPresented: $authWithPhoneNumber.showErrorAlert, actions: {})
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.top)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Log In")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .background(BeautifulBackground())
            .contentShape(Rectangle())
            .onTapGesture {
                self.hideKeyboard()
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .gesture(
                DragGesture()
                    .onEnded() {_ in
                        presentationMode.wrappedValue.dismiss()
                    }
            )
        }
    }
}

@available(iOS 15.0.0, *)
struct EnterVerificationCode_Previews: PreviewProvider {
    static var previews: some View {
        EnterVerificationCode()
    }
}
