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
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Image("beautifulBackgroundImage")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geometry.size.width, height: geometry.size.height-35)
                    
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.7), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                            .frame(width: geometry.size.width,height: (geometry.size.height * 0.6))
                            .padding(.top, -100)
                        Spacer()
                    }
                    
                    VStack {
                        TextFieldPattern(text: $phoneNumber, topLabel: phoneNumberText, placeholderText: phoneNumberText, unremovablePrefix: unremovablePrefix)
                            .keyboardType(.decimalPad)
                            .padding(.top, 10)
                        Spacer()
                        
                        NavigationLink(destination: EnterVerificationCode()
                                        .navigationBarTitleDisplayMode(.inline)
                                        .navigationBarHidden(true),
                                       isActive: $authWithPhoneNumber.presentEnterPasswordView) { EmptyView() }
                        
                        Button(nextText) {
                            authWithPhoneNumber.passPhoneNumber(phoneNumber: phoneNumber, authUIDelegate: authDelegat)
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

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0.0, *) {
            EnterPhoneNumber()
        } else {
            // Fallback on earlier versions
        }
    }
}
