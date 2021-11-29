//
//  CalculatorClass.swift
//  Calculator
//
//  Created by 吳偉平 on 2021/11/24.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    //Global property
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    //Calculation
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            
            switch symbol {
                
            case "+/-":
                return n * -1
                
            case "AC":
                return 0
                
            case "%":
                return n / 100
                
            case "=":
                return performTwoNumberCalculation(n2: n)
                
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
                //+, -, *. /
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcMethod {
            
            switch operation {
                
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
