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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isEndEditNumber = true
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isEndEditNumber {
                displayLabel.text = numValue
                isEndEditNumber = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }


}

