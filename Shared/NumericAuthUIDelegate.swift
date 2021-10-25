//
//  AuthUIDelegate.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 14.10.2021.
//

import Foundation
import Combine
import FirebaseAuth
import UIKit
import SwiftUI

@available(iOS 15.0.0, *)
class NumericAuthUIDelegate: NSObject, ObservableObject, AuthUIDelegate{
    @Published var flag: Bool = false
    var viewControllerToPresent: UIViewController = UIViewController()
    
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.viewControllerToPresent = viewControllerToPresent
        self.flag = flag
    }
    
//    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool) async {
//
//        await self.present(viewControllerToPresent, animated: true)
//    }

    func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        print("What the fuck?")
    }
    
//    func dismiss(animated flag: Bool) async {
//        <#code#>
//    }
    
    
}
