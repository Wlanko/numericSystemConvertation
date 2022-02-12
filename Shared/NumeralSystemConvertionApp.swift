//
//  NumeralSystemConvertionApp.swift
//  Shared
//
//  Created by Vlad Kyrylenko on 25.09.2021.
//

import SwiftUI
import Firebase

@available(iOS 15.0.0, *)
@main
struct NumeralSystemConvertionApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser != nil {
                ContentView()
            } else {
                EnterPhoneNumber()
            }
        }
    }
    
    init() {
            let navBarAppearance = UINavigationBar.appearance()
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            //FirebaseApp.configure()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
      for urlContext in URLContexts {
          let url = urlContext.url
          Auth.auth().canHandle(url)
      }
      // URL not auth related, developer should handle it.
    }
}



