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
    let unremovablePrefix = "+380"
    
    @State var phoneNumber: String = "+380"
    var nextText = "Next"
    @ObservedObject var authDelegat = NumericAuthUIDelegate()
    @ObservedObject var authWithPhoneNumber = AuthWithPhoneNumber()
    var phoneNumberText = "Phone number"
    
    
    var body: some View {
        NavigationView {
            GeometryReader { _ in
                ZStack {
                    Image("beautifulBackgroundImage")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                        .padding(.top, -95)
                        .ignoresSafeArea(.keyboard, edges: .bottom)
                    
                    VStack {
                        TextFieldPattern(text: $phoneNumber, topLabel: phoneNumberText, placeholderText: phoneNumberText, unremovablePrefix: unremovablePrefix)
                            .keyboardType(.decimalPad)
                            .padding(.top, 20)
                        
                        Spacer()
                        
                        NavigationLink(destination: EnterVerificationCode()
                                        .navigationBarTitleDisplayMode(.inline)
                                        .navigationBarHidden(true),
                                       isActive: $authWithPhoneNumber.presentEnterPasswordView) { EmptyView() }
                        
                        Button(nextText) {
                            authWithPhoneNumber.passPhoneNumber(phoneNumber: phoneNumber, authUIDelegate: authDelegat)
                        }
                        .alert(authWithPhoneNumber.errorMessage, isPresented: $authWithPhoneNumber.showErrorAlert, actions: {})
                        .padding(.bottom, 60)
                    }
<<<<<<< Updated upstream
                    .alert(authWithPhoneNumber.errorMessage, isPresented: $authWithPhoneNumber.showErrorAlert, actions: {})
                    .padding(.bottom, 10)
=======
                    .padding(.top)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Log In")
                }
                .ignoresSafeArea(.keyboard)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.hideKeyboard()
>>>>>>> Stashed changes
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
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
