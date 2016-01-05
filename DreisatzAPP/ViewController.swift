//
//  ViewController.swift
//  DreisatzAPP
//
//  Created by Thiel, Alexander on 31.05.15.
//  Copyright (c) 2015 Thiel, Alexander. All rights reserved.
//

import UIKit


    class CustomTextField: UITextField{
        required init?(coder aDecoder: NSCoder) {
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
		
        @IBOutlet weak var Solution_Label: UILabel!
        
		override func didReceiveMemoryWarning() {
			super.didReceiveMemoryWarning()
			// Dispose of any resources that can be recreated.
		}
		
        override func viewDidLoad() {
            super.viewDidLoad()
            Eingabe1_TF.delegate = self
            Eingabe2_TF.delegate = self
            Eingabe3_TF.delegate = self
			
			Solutionphrase_ini()
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
            //Solution_Label.text = ""
			Solutionphrase_ini()
        }
        
		

		func Solutionphrase_ini () {
			let Solutionfield1 = NSLocalizedString("Solution_Label_part_1", comment:"Solution_Label_Part_1") + ("XX") + NSLocalizedString("Solution_Label_part_2", comment:"Solution_Label_Part_2") + ("YY") + NSLocalizedString("Solution_Label_part_3", comment:"Solution_Label_Part_3") + ("ZZ")
			let Solutionfield2 = NSLocalizedString("Solution_Label_part_4", comment:"Solution_Label_Part_4") + ("XYZ") + NSLocalizedString("Solution_Label_part_5", comment:"Solution_Label_Part_5")
						
			Solution_Label.text = Solutionfield1 + Solutionfield2
			
		}
		
		
		func Solutionphrase () {
			let Solutionfield1 = NSLocalizedString("Solution_Label_part_1", comment:"Solution_Label_Part_1") + (Eingabe1_TF.text)! + NSLocalizedString("Solution_Label_part_2", comment:"Solution_Label_Part_2") + (Eingabe2_TF.text)! + NSLocalizedString("Solution_Label_part_3", comment:"Solution_Label_Part_3") + (Eingabe3_TF.text)!
			let Solutionfield2 = NSLocalizedString("Solution_Label_part_4", comment:"Solution_Label_Part_4") + (Ergebnis_Label.text)! + NSLocalizedString("Solution_Label_part_5", comment:"Solution_Label_Part_5")
			
			
			Solution_Label.text = Solutionfield1 + Solutionfield2

		}
		
        override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            view.endEditing(true)
            super.touchesBegan(touches, withEvent: event)
        }
        
        override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
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
			Solutionphrase()
            return true
        }
        
        
        func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
            
            textField.text = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
			Solutionphrase()
			checkEingabe()
            return false
        }
        
        
		@IBAction func Clear_Button(sender: AnyObject) {
			  clearButtonPressed()
		}
        
        func checkEingabe() {
			
			//let zahl1 = NSString (string:Eingabe1_TF.text!).doubleValue
			//let zahl2 = NSString (string:Eingabe2_TF.text!).doubleValue
			//let zahl3 = NSString (string:Eingabe3_TF.text!).doubleValue


			let zahl1_hilfe = NSString (string:Eingabe1_TF.text!)
			let zahl1_formel = zahl1_hilfe.stringByReplacingOccurrencesOfString(",", withString: ".")
			let zahl1 = NSString (string: zahl1_formel).doubleValue

			let zahl2_hilfe = NSString (string:Eingabe2_TF.text!)
			let zahl2_formel = zahl2_hilfe.stringByReplacingOccurrencesOfString(",", withString: ".")
			let zahl2 = NSString (string: zahl2_formel).doubleValue

			let zahl3_hilfe = NSString (string:Eingabe3_TF.text!)
			let zahl3_formel = zahl3_hilfe.stringByReplacingOccurrencesOfString(",", withString: ".")
			let zahl3 = NSString (string: zahl3_formel).doubleValue
			
            
            if Eingabe1_TF.text!.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) == 0 {
                self.Formel_LF.text = NSLocalizedString("Eingabe_1", comment: "Eingabe 1 ist leer")
                return
            } else if
                
                Eingabe2_TF.text!.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) == 0 {
                    Formel_LF.text = NSLocalizedString("Eingabe_2", comment: "Eingabe 2 ist leer")
                    return
            } else if
                
                Eingabe3_TF.text!.lengthOfBytesUsingEncoding(NSASCIIStringEncoding) == 0 {
                    Formel_LF.text = NSLocalizedString("Eingabe_3", comment: "Eingabe 3 ist leer")
                    return
            }
            
            
//          Formel_LF.text = "(\(zahl2) / \(zahl3))  * \(zahl1) = \(zahl2 / zahl3 * zahl1)"
//          Ergebnis_Label.text = numberFormatter.stringFromNumber(zahl2 / zahl3 * zahl1)

			Formel_LF.text = "(\(zahl2) * \(zahl1))  / \(zahl3) = \(zahl2 * zahl1 / zahl3)"
			Ergebnis_Label.text = numberFormatter.stringFromNumber(zahl2 * zahl1 / zahl3)

			
			Solutionphrase()
			
		}
        
		var numberFormatter: NSNumberFormatter {
			let formatter = NSNumberFormatter()
			formatter.numberStyle = .DecimalStyle
			return formatter
		}
        
        
        
        
        
    }