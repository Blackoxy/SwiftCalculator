//
//  ViewController.swift
//  Calculator
//
//  Created by Anh Nguyen on 5/12/20.
//  Copyright © 2020 Anh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//NEED to add clearing of numberDisplayLabel after user pushes '=' and types in new number
//NEED to add +/- logic
//NEED to add decimal point
//NEED to add % logic
    
    @IBOutlet weak var numberDisplayLabel: UILabel?
    var numberDisplayed: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func numbers(_ sender: UIButton) {
        let tag = sender.tag - 1
        if performingMath {
            numberDisplayLabel?.text = String(tag)
            if let unwrapped = numberDisplayLabel?.text {
                numberDisplayed = Double(unwrapped)!
            }
            performingMath = false
        } else {
            guard let numberOnScreen = numberDisplayLabel?.text else { return }
            numberDisplayLabel?.text = numberOnScreen + String(tag)
            if let unwrapped = numberDisplayLabel?.text {
                           numberDisplayed = Double(unwrapped)!
                       }
        }


    }

    @IBAction func buttons(_ sender: UIButton) {
        let tag = sender.tag
        if numberDisplayLabel?.text != "" && tag != 11 && tag != 16 {
            if let unwrapped = numberDisplayLabel?.text {
                           previousNumber = Double(unwrapped)!

                        switch tag {
                            case 12:
                                print("divide")
                                numberDisplayLabel?.text = "/"

                            case 13:
                                print("multiply")
                                numberDisplayLabel?.text = "x"

                            case 14:
                                print("subtract")
                                numberDisplayLabel?.text = "-"

                            case 15:
                                print("add")
                                numberDisplayLabel?.text = "+"

                            default:
                                print("uhhh")
                        }
            }
            operation = tag
            performingMath = true
        }
        if tag == 16 {
            switch operation {
            case 12:
                numberDisplayLabel?.text = "\(Double(previousNumber / numberDisplayed))"
            case 13:
                numberDisplayLabel?.text = "\(Double(previousNumber * numberDisplayed))"
            case 14:
                numberDisplayLabel?.text = "\(Double(previousNumber - numberDisplayed))"
            case 15:
                numberDisplayLabel?.text = "\(Double(previousNumber + numberDisplayed))"
            default:
                print("oh")
            }
        } else if tag == 11 {
            numberDisplayLabel?.text = ""
            previousNumber = 0
            numberDisplayed = 0
            operation = 0

        }
    }

}

