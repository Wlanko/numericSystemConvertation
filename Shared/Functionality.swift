//
//  Functionality.swift
//  NumeralSystemConvertion
//
//  Created by Vlad Kyrylenko on 26.09.2021.
//

import Foundation

func convertation(iNum: String, iNS: String, oNS: String) -> String {
    var num: Int = 0
    var ans: [String] = []
    let charList = ["10": "A", "11": "B", "12": "C", "13": "D", "14": "E", "15": "F"]
    // Converting to base 10
    if let myDecimal = Int(iNum, radix: Int(iNS) ?? 10) {
        num = myDecimal
    } else {
        print("Bad input")
    }
    
    // Converting to required base
    
    while num >= 1 {
        if num % Int(oNS)! > 9 {
            ans.append(charList[String(num % Int(oNS)!)]!)
        } else {
            ans.append(String(num % Int(oNS)!))
        }
        num = Int(num / Int(oNS)!)
    }
    
    ans = ans.reversed()
    
    return ans.joined()
    
}
