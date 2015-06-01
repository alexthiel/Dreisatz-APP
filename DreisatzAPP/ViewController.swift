//
//  ViewController.swift
//  DreisatzAPP
//
//  Created by Thiel, Alexander on 31.05.15.
//  Copyright (c) 2015 Thiel, Alexander. All rights reserved.
//

import UIKit

// class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//    }


    
    class CustomTextField: UITextField{
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            
            //Border
            self.layer.cornerRadius = 10.0;
            self.layer.borderWidth = 1.5
            self.layer.borderColor = UIColor.lightGrayColor().CGColor
            
            //Background
            //self.backgroundColor = UIColor.lightGrayColor()
            //Text
            //self.textColor = UIColor.whiteColor()
            self.textAlignment = NSTextAlignment.Right
            
        }
    }
    
    
    class ViewController: UIViewController, UITextFieldDelegate {
        @IBOutlet weak var Eingabe1_TF: CustomTextField!
        @IBOutlet weak var Eingabe2_TF: CustomTextField!
        @IBOutlet weak var Eingabe3_TF: CustomTextField!

        @IBOutlet weak var Formel_LF: UILabel!
        @IBOutlet weak var Ergebnis_Label: UILabel!
		
        
		override func didReceiveMemoryWarning() {
			super.didReceiveMemoryWarning()
			// Dispose of any resources that can be recreated.
		}
		
        override func viewDidLoad() {
            super.viewDidLoad()
            Eingabe1_TF.delegate = self
            Eingabe2_TF.delegate = self
            Eingabe3_TF.delegate = self
            
        }
        
        override func canBecomeFirstResponder() -> Bool {
            return true
            
        }
        
        func clearButtonPressed () {
            Eingabe1_TF.text = ""
            Eingabe2_TF.text = ""
            Eingabe3_TF.text = ""
            Formel_LF.text = ""
            Ergebnis_Label.text = ""
            
        }
        
        
        override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
            view.endEditing(true)
            super.touchesBegan(touches, withEvent: event)
        }
        
        override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
            if motion == .MotionShake{
                clearButtonPressed()
            }
        }
        
        
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            self.view.endEditing(true);
            return false;
        }
        
        
        func textFieldShouldClear(textField: UITextField) -> Bool {
            checkEingabe()
            return true
        }
        
        
        func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
            
            textField.text = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
            checkEingabe()
            return false
        }
        
        
		@IBAction func Clear_Button(sender: AnyObject) {
			  clearButtonPressed()
		}
        
        func checkEingabe() {
            
            let zahl1 = NSString (string:Eingabe1_TF.text).doubleValue
            let zahl2 = NSString (string:Eingabe2_TF.text).doubleValue
            let zahl3 = NSString (string:Eingabe3_TF.text).doubleValue
            
            
            if Eingabe1_TF.text.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) == 0 {
                Formel_LF.text = "Eingabe 1 leer"
                return
            } else if
                
                Eingabe2_TF.text.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) == 0 {
                    Formel_LF.text = "Eingabe 2 leer"
                    return
            } else if
                
                Eingabe3_TF.text.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) == 0 {
                    Formel_LF.text = "Eingabe 3 leer"
                    return
            }
            
            
            Formel_LF.text = "(\(zahl2) / \(zahl3))  * \(zahl1) = \(zahl2 / zahl3 * zahl1)"
            Ergebnis_Label.text = "\(zahl2 / zahl3 * zahl1)"
            
            
        }
        
        
        
        
        
        
        
    }
    

 
//}

