//
//  AuthentificationWithPhoneNumber.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 10.10.2021.
//

import Foundation
import FirebaseAuth
import Combine
import SwiftUI

@available(iOS 15.0.0, *)
class AuthWithPhoneNumber: ObservableObject {
    @Published var presentEnterPasswordView: Bool = false
    @Published var presentMainView: Bool = false
    
    @Published var showErrorAlert: Bool = false
    var errorMessage: String = "Some Error occured"
    
    let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)

    
    func passPhoneNumber(phoneNumber: String, authUIDelegate: NumericAuthUIDelegate){
        #if DEBUG
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        #endif
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in

                if let error = error {
                    print(error.localizedDescription)
                    self.showErrorAlert = true
                    self.errorMessage = error.localizedDescription
                    return
                }
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                self.presentEnterPasswordView = true
                    
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
                self.showErrorAlert = true
                self.errorMessage = error.localizedDescription
                return
            }
            self.presentMainView = true
        }
    }
    
    func signOutUser() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
