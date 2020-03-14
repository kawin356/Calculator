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
    private var isEqualagain: Bool = false
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "AC":
                isEqualagain = false
                return 0
            case "+/-":
                return n * -1
            case "%":
                if let newNum = intermediateCalculation?.n1 {
                    return n / 100 * newNum
                } else {
                    return n / 100
                }
            case "=":
                return performNumberCalculation(newNum: n)
            default:
                isEqualagain = false
                self.intermediateCalculation = (n1: n, calMethod: symbol)
            }
        }
        return nil
    }
    
    mutating func performNumberCalculation(newNum: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calMethod {
            defer {
                if isEqualagain == false {
                    self.intermediateCalculation = (n1: newNum, calMethod: operation)
                    isEqualagain = true
                }
            }
            switch operation {
            case "+":
                return n1 + newNum
            case "-":
                return !isEqualagain ? n1 - newNum : newNum - n1
            case "x":
                return n1 * newNum
            case "/":
                return !isEqualagain ? n1 / newNum : newNum / n1
            default:
                return nil
            }
        }
        return nil
    }
}
