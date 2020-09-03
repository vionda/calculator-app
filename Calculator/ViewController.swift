//
//  ViewController.swift
//  Calculator
//
//  Created by Vionda on 9/3/20.
//  Copyright © 2020 Vionda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperation: Operator = Operator.nothing
    var calcState: calculationState = calculationState.enteringNum
    
    var firstValue: String = ""

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //button actions
    @IBAction func numberClicked(_ sender: UIButton){
        updateDisplay(number: String(sender.tag))
    }
    func updateDisplay(number: String){
        //check if we have a new number started
        if calcState == calculationState.newNumStarted{
            //check if we can get sth out of the existing label
            if let num = resultLabel.text{
                //if we have sth there, store a value
                if num != ""{
                    firstValue = num
                }
            }
            calcState = calculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == calculationState.enteringNum{
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    @IBAction func operatorClicked(_ sender: UIButton){
        calcState = calculationState.newNumStarted
        
        if let num = resultLabel.text{
            if num != "" {
                firstValue = num
                resultLabel.text = ""
            }
        }
        
        switch sender.tag {
        case 10:
            currentOperation = Operator.add
        case 11:
           currentOperation = Operator.subtract
        case 12:
            currentOperation = Operator.times
        case 13:
            currentOperation = Operator.divide
        default:
            return
        }
    }
    
    @IBAction func equalsClicked(_ sender: UIButton){
        calculateSum()
    }
    func calculateSum(){
        if (firstValue.isEmpty){
            return
        }
        
        var result = ""
        
        if currentOperation == Operator.times{
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.divide{
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.add{
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.subtract{
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        calcState = calculationState.newNumStarted
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

