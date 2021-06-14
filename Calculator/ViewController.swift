//
//  ViewController.swift
//  Calculator
//
//  Created by Paresh Thakkar on 11/06/21.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "Null"
}
class ViewController: UIViewController {
    
    @IBOutlet var btnAllScientific: [UIButton]!
    @IBOutlet weak var txtDisplay: UITextField!
    @IBOutlet weak var viewLanscape: UIView!
    @IBOutlet weak var viewPortrait: UIView!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOpration:Operation = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtDisplay.text = "0"
        self.checkDeviceMode()
        self.setupButtonText()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.checkDeviceMode()
    }
    @IBAction func btnAllClearClicked(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOpration = .Null
        txtDisplay.text = "0"
    }
    @IBAction func btnNumberClicked(_ sender: UIButton) {
        if runningNumber.count <= 8
        {
        runningNumber += "\(sender.tag)"
        txtDisplay.text = runningNumber
        }
    }
    
    @IBAction func btnAddClicked(_ sender: UIButton) {
        operation(operation: .Add)
    }
    @IBAction func btnSubtractClicked(_ sender: UIButton) {
        operation(operation: .Subtract)

    }
    @IBAction func btnDivideClicked(_ sender: UIButton) {
        operation(operation: .Divide)

    }
    @IBAction func btnMultiplicationClicked(_ sender: UIButton) {
        operation(operation: .Multiply)

    }
    @IBAction func btnDotClicked(_ sender: UIButton) {
        if runningNumber.count <= 7
        {
        runningNumber += "."
        txtDisplay.text = runningNumber
        }

    }
    @IBAction func btnEqualsClicked(_ sender: UIButton) {
        operation(operation: currentOpration)

    }
}
extension ViewController
{
    func operation(operation:Operation)
    {
        if currentOpration != .Null
        {
            if runningNumber != ""
            {
                rightValue = runningNumber
                runningNumber = ""
                if currentOpration == .Add
                {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }
                else if currentOpration == .Subtract
                {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }
                else if currentOpration == .Multiply
                {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }
                else if currentOpration == .Divide
                {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0)
                {
                    result = "\(Int(Double(result)!))"
                }
                txtDisplay.text = result
            }
            currentOpration = operation
        }
        else
        {
            leftValue = runningNumber
            runningNumber = ""
            currentOpration = operation
        }
        
    }
    func checkDeviceMode()
    {
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft {
            viewPortrait.isHidden = true
            viewLanscape.isHidden = false
        }
        else if UIDevice.current.orientation == UIDeviceOrientation.landscapeRight{
            viewPortrait.isHidden = true
            viewLanscape.isHidden = false
        }
        else if UIDevice.current.orientation == UIDeviceOrientation.portraitUpsideDown{
            viewPortrait.isHidden = false
            viewLanscape.isHidden = true
        }
        else if UIDevice.current.orientation == UIDeviceOrientation.portrait {
            viewPortrait.isHidden = false
            viewLanscape.isHidden = true
        }
    }
    func setupButtonText()
    {
        for btn in btnAllScientific
        {
            if btn.tag == 13
            {
                let bigFont = UIFont.systemFont(ofSize: 25)
                let smallFont = UIFont.systemFont(ofSize: 12)
                
                let title = NSMutableAttributedString(string: "2", attributes: [.font: bigFont])
                title.append(NSMutableAttributedString(string: "nd", attributes: [.font: smallFont, .baselineOffset: 10]))
                btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                btn.setAttributedTitle(title, for: .normal)
            }
            if btn.tag == 14
            {
                let bigFont = UIFont.systemFont(ofSize: 25)
                let smallFont = UIFont.systemFont(ofSize: 12)
                
                let title = NSMutableAttributedString(string: "x", attributes: [.font: bigFont])
                title.append(NSMutableAttributedString(string: "2", attributes: [.font: smallFont, .baselineOffset: 10]))
                btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                btn.setAttributedTitle(title, for: .normal)
            }
            if btn.tag == 15
            {
                let bigFont = UIFont.systemFont(ofSize: 25)
                let smallFont = UIFont.systemFont(ofSize: 12)
                
                let title = NSMutableAttributedString(string: "x", attributes: [.font: bigFont])
                title.append(NSMutableAttributedString(string: "3", attributes: [.font: smallFont, .baselineOffset: 10]))
                btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                btn.setAttributedTitle(title, for: .normal)
            }
            if btn.tag == 16
            {
                let bigFont = UIFont.systemFont(ofSize: 25)
                let smallFont = UIFont.systemFont(ofSize: 12)
                
                let title = NSMutableAttributedString(string: "x", attributes: [.font: bigFont])
                title.append(NSMutableAttributedString(string: "y", attributes: [.font: smallFont, .baselineOffset: 10]))
                btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                btn.setAttributedTitle(title, for: .normal)
            }
            if btn.tag == 17
            {
                let bigFont = UIFont.systemFont(ofSize: 25)
                let smallFont = UIFont.systemFont(ofSize: 12)
                
                let title = NSMutableAttributedString(string: "e", attributes: [.font: bigFont])
                title.append(NSMutableAttributedString(string: "x", attributes: [.font: smallFont, .baselineOffset: 10]))
                btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                btn.setAttributedTitle(title, for: .normal)
            }
            if btn.tag == 18
            {
                let bigFont = UIFont.systemFont(ofSize: 25)
                let smallFont = UIFont.systemFont(ofSize: 12)
                
                let title = NSMutableAttributedString(string: "10", attributes: [.font: bigFont])
                title.append(NSMutableAttributedString(string: "x", attributes: [.font: smallFont, .baselineOffset: 10]))
                btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                btn.setAttributedTitle(title, for: .normal)
            }
        }
        
    }
    func toIntConvert(value :String) -> Int
    {
        var passValue : Int = 0
        passValue  = Int(value)!
        return passValue
    }
    
    
}

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

