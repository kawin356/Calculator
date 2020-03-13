//
//  CalculateLogic.swift
//  Calculator
//
//  Created by Kittikawin Sontinarakul on 13/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import Foundation

struct CalculateLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "=":
                return performNumberCalculation(newNum: n)
            default:
                self.intermediateCalculation = (n1: n, calMethod: symbol)
            }
        }
        return nil
    }
    
    func performNumberCalculation(newNum: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calMethod {
            switch operation {
            case "+":
                return n1 + newNum
            case "-":
                return n1 - newNum
            case "x":
                return n1 * newNum
            case "/":
                return n1 / newNum
            default:
                return 0.0
            }
        }
        return nil
    }
}
