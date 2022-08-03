//
//  ViewController.swift
//  Calculator
//
//  Created by Aleksey Ryabchenko on 16.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calcWork: UILabel!
    @IBOutlet weak var calcResult: UILabel!
    
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll() {
        workings = ""
        calcWork.text = ""
        calcResult.text = ""
    }
    
    @IBAction func acClearButton(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func backTapButton(_ sender: Any) {
        if (!workings.isEmpty) {
            workings.removeLast()
            calcWork.text = workings
        }
    }
    
    func addToWorkings(value: String) {
        workings = workings + value
        calcWork.text = workings
    }
    
    @IBAction func percentButton(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func divideTapButton(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func timesTapButton(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func minusTapButton(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func plusTapButton(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func equalsTapButton(_ sender: Any) {
        if (validInput()) {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calcResult.text = resultString
        } else {
            let alert = UIAlertController(title: "Invalid Input", message: "Calculator unable to do math bassed on input", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char  in workings {
            if (specialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if (index == 0){
                return false
            }
            if (index == workings.count - 1){
                return false
            }
            
            if (previous != -1) {
                if (index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool {
        if(char == "*") {
            return true
        }
        if(char == "/") {
            return true
        }
        if(char == "+") {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func decimalTapButton(_ sender: Any) {
        addToWorkings(value: ".")
    }
    @IBAction func ziroTapButton(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func oneTapButton(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func twoTapButton(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func threeTapButton(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func fourTapButton(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func fiveTapButton(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func sixTapButton(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func sevenTapButton(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func eightTapButton(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func nineTapButton(_ sender: Any) {
        addToWorkings(value: "9")
    }
}

