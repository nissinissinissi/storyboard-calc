//
//  ViewController.swift
//  storyboard calc
//
//  Created by User on 8 Tishri 5783.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstLabel: UITextField!
    
    @IBOutlet weak var secondLabel: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    
    
     func NumberGiven(_ v: String?) -> Bool{
         v != nil && Double(v!) != nil ? true : false
     }
     
     func numberOutOfString(_ n: String?) -> Double{
         var number: Double = 0
         
         if let n = n {
             if let x = Double(n){
                 number = x
             }
         }
         return number
     }
   
    func WholeNumberValue(_ v: Double) -> Bool{
        v.truncatingRemainder(dividingBy: 1) == 0
    }
    
    func calculateValues(_ v1: String?, _ v2: String?, action: String){
        var summ: Double = 0
        if NumberGiven(v1) && NumberGiven(v2){
            
            let firstNumber: Double = numberOutOfString(v1)
            let secondNumber: Double = numberOutOfString(v2)
            
            switch action{
            case "+": summ = firstNumber + secondNumber
            case "-": summ = firstNumber - secondNumber
            case "*": summ = firstNumber * secondNumber
            case "/": summ = firstNumber / secondNumber
            default: print("unexpected error caught!")
            }
            
            if WholeNumberValue(summ){
                resultLabel.text = String(Int(summ))
            } else {
                resultLabel.text = String(summ)
            }
            
            
            
        
        } else { resultLabel.text = "введите число!" }
    }
    

    
    
    @IBAction func plus(_ sender: Any) {
        calculateValues(firstLabel.text, secondLabel.text, action: "+")

    }
    @IBAction func minus(_ sender: Any) {
        calculateValues(firstLabel.text, secondLabel.text, action: "-")
    }
    @IBAction func multiply(_ sender: Any) {
        calculateValues(firstLabel.text, secondLabel.text, action: "*")
    }
    @IBAction func division(_ sender: Any) {
        calculateValues(firstLabel.text, secondLabel.text, action: "/")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

