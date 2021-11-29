//
//  CalculatorClass.swift
//  Calculator
//
//  Created by 吳偉平 on 2021/11/24.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    //Set true when stat.
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else {
                //Get dispay number into double by using nil coalescing operator.
                
                fatalError("Cannot convert display label text to a Double.")
                //Guard let else {} will execute when nil.
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
            //Update displayLabel when get newValue.
        }
    }
    
    private var calculator = CalculatorLogic()
                //(number passing and going to be displayValue)
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        //After user pressed caculaor button, set back to true.
        
        calculator.setNumber(displayValue)
        //Pass result number from CalculatorLogic to VC
        
        if let calcMethod = sender.currentTitle {
            //Pass over the symbol is calcMethod.

            if let result = calculator.calculate(symbol: calcMethod) {
                //If result is nil, show error.
                
                displayValue = result
            }
           
        }
            
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            //Check not nil then send numButtonPressed to displayLabel
            
            if isFinishedTypingNumber {
                //If it's ture, we are starting out with a new number.
                
                displayLabel.text = numValue
                //When user start typing number.
                
                isFinishedTypingNumber = false
                //Setting to false til user press caculator buttons.
                
            } else {
                
                if numValue == "." && displayLabel.text!.contains(".") {
                    return
                }
                //Check displayLabel have dot or not. Jump out whole function
                
                displayLabel.text = displayLabel.text! + numValue
                //Keep append numValue til user press calc buttom.
                
            }
            
            
        }
    }
    
    
}


