//
//  CalculateLogic.swift
//  Calculator
//
//  Created by Kittikawin Sontinarakul on 13/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import Foundation

struct CalculateLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        switch symbol {
        case "AC":
            return 0
        case "+/-":
            return number * -1
        case "%":
            return number / 100
        default:
            return nil
        }
    }
}
