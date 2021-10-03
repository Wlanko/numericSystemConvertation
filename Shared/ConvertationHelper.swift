//
//  Functionality.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 26.09.2021.
//

import Foundation


struct ConvertationHelper {
    static func numericConvertation(iNum: String, iNS: String, oNS: String) throws -> String {
        var num: Int = 0
        var ans: [String] = []
        
        // Converting to base 10
        if let myDecimal = Int(iNum, radix: Int(iNS) ?? 10) {
            num = myDecimal
        } else {
            throw ErrorForNumericConversion.invalidInput// error handling
        }
        
        
        let charForNumeric = Int(("A" as UnicodeScalar).value)
        
        // Converting to required base
        if let outputNumericSystem = Int(oNS) {
            while num >= 1 {
                if num % outputNumericSystem > 9 {
                    if let element = UnicodeScalar(charForNumeric + (num % outputNumericSystem - 10)) {
                        ans.append(String(element))
                    }
                } else {
                    ans.append(String(num % outputNumericSystem))
                }
                num = Int(num / outputNumericSystem)
            }
        } else {
            throw ErrorForNumericConversion.wrongNumericSystem
        }
        
        ans = ans.reversed()
        
        return ans.joined()
        
    }
}
