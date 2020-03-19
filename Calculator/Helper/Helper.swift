//
//  Helper.swift
//  Calculator
//
//  Created by Kittikawin Sontinarakul on 19/3/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import Foundation


func checkHasDecimal(_ num: Double) -> Bool {
    return floor(num) != num ? true : false
}
