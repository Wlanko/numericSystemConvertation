//
//  NumeralSystemConvertionApp.swift
//  Shared
//
//  Created by Vlad Kyrylenko on 25.09.2021.
//

import SwiftUI
import Firebase

@main
struct NumeralSystemConvertionApp: App {
    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser != nil {
                ContentView()
            } else {
                EnterPhoneNumber(presentVerificationCodeView: .constant(false))
            }
        }
    }
    init() {
        FirebaseApp.configure()
    }
}

