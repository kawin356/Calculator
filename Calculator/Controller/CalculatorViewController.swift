//
//  ViewController.swift
//  Calculator
//
//  Created by Kittikawin Sontinarakul on 11/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isEndEditNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert DisplayLabel to Double")
            }
            return number
        }
        set {
            if checkHasDecimal(newValue){
                displayLabel.text = String(format: "%.2f", newValue)
            } else {
                displayLabel.text = String(format: "%.0f", newValue)
            }
            
        }
    }
    
    private var calLogic = CalculateLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isEndEditNumber = true
        calLogic.setNumber(displayValue)
        
        if let calMethod = sender.currentTitle {
            if let result = calLogic.calculate(symbol: calMethod) {
                displayValue = result
            }
            
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isEndEditNumber {
                isEndEditNumber = false
                if numValue == "." {
                    displayLabel.text = "0."
                    return
                }
                displayLabel.text = numValue
            } else {
                if numValue == "." {
                    if (displayLabel.text?.hasPrefix("."))! {
                        print("have .")
                        return
                    }
                    //let isInt = floor(displayValue) == displayValue
                    if checkHasDecimal(displayValue) {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }


}

