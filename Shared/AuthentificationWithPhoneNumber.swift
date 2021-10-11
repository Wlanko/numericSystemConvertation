//
//  AuthentificationWithPhoneNumber.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 10.10.2021.
//

import Foundation
import FirebaseAuth

struct AuthWithPhoneNumber {
    static func passPhoneNumber(phoneNumber: String) -> Bool {
        var flag: Bool = false
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                    flag = true
                }
            }
        return flag
    }
    
    static func signInUserWithVErificationCode(verificationCode: String) -> Bool {
        var flag = false
        guard let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") else {
            print("Error, verification id is not available")
            return flag
        }
        
        let credintial = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        
        
        Auth.auth().signIn(with: credintial) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        
        return flag
    }
}
