//
//  ErrorHandlingForConversion.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 01.10.2021.
//

import Foundation

enum ErrorForNumericConversion: Error, LocalizedError {
    case invalidInput
    case wrongNumericSystem
    case numbreDoesNotConfirmToNumericSystem
    
    public var errorDescription: String{
        switch self {
        case .invalidInput:
            return "invalidInput"
        case .wrongNumericSystem:
            return "wrongNumericSystem"
        case .numbreDoesNotConfirmToNumericSystem:
            return "numbreDoesNotConfirmToNumericSystem"
        default:
            return "Some else"
        }
    }
}


