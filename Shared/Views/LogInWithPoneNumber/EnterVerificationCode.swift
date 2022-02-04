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
            GeometryReader { _ in
                ZStack {
                    Image("beautifulBackgroundImage")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                        .padding(.top, -95)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    VStack{
                        TextFieldPattern(text: $verificationCode, topLabel: textForVerificarionCodeTextField, placeholderText: textForVerificarionCodeTextField, unremovablePrefix: unremovablePrefix)
                            .keyboardType(.decimalPad)
                            .padding(.top, 10)
                        
                        Spacer()
                        
                        NavigationLink(destination: ContentView()
                                        .navigationBarTitleDisplayMode(.inline)
                                        .navigationBarHidden(true),
                                       isActive: $authWithPhoneNumber.presentMainView) { EmptyView() }
                        
                        Button("Next") {
                            authWithPhoneNumber.signInUserWithVErificationCode(verificationCode: self.verificationCode)
                        }
                        .alert(authWithPhoneNumber.errorMessage, isPresented: $authWithPhoneNumber.showErrorAlert, actions: {})
                        .padding(.bottom, 80)
                        
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
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    self.hideKeyboard()
                }
            }
        }
        .gesture(
            DragGesture()
                .onEnded() {_ in
                    presentationMode.wrappedValue.dismiss()
                }
        )
    }
}

@available(iOS 15.0.0, *)
struct EnterVerificationCode_Previews: PreviewProvider {
    static var previews: some View {
        EnterVerificationCode()
    }
}
