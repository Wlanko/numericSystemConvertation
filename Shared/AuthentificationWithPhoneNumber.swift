//
//  AuthentificationWithPhoneNumber.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 10.10.2021.
//

import Foundation
import FirebaseAuth
import Combine

@available(iOS 15.0.0, *)
class AuthWithPhoneNumber: ObservableObject {
    
    
    
    @Published var flag: Bool = false
    
    func passPhoneNumber(phoneNumber: String, authUIDelegate: NumericAuthUIDelegate){
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                    self.flag = true
                    
                }
            }
    }
    
    func signInUserWithVErificationCode(verificationCode: String) {
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
            print("Error, verification id is not available")
            return
        }
        
        let credintial = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        
        
        Auth.auth().signIn(with: credintial) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
