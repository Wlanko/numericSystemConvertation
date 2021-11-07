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
        GeometryReader { geometry in
        NavigationView {
            ZStack {
                Image("beautifulBackgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width, height: geometry.size.height-35)
                
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                        .frame(width: geometry.size.width,height: (geometry.size.height * 0.5))
                        .padding(.top, -100)
                    Spacer()
                }
                
                VStack{
                    TextFieldPattern(text: $verificationCode, topLabel: textForVerificarionCodeTextField, placeholderText: textForVerificarionCodeTextField, unremovablePrefix: unremovablePrefix)
                    
                    Spacer()
                    
                    NavigationLink(destination: ContentView()
                                    .navigationBarTitleDisplayMode(.inline)
                                    .navigationBarHidden(true),
                                   isActive: $authWithPhoneNumber.presentMainView) { EmptyView() }
                    
                    Button("Next") {
                        authWithPhoneNumber.signInUserWithVErificationCode(verificationCode: self.verificationCode)
                    }
                    .alert(authWithPhoneNumber.errorMessage, isPresented: $authWithPhoneNumber.showErrorAlert, actions: {})
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                    
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                self.hideKeyboard()
            }
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
