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
			self.layer.borderColor = UIColor.lightGray.cgColor
            
            //Background
            //self.backgroundColor = UIColor.lightGrayColor()
            //Text
            //self.textColor = UIColor.whiteColor()
			self.textAlignment = NSTextAlignment.right
            
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
        
        func canBecomeFirstResponder() -> Bool {
            return true
            
        }
        
        func clearButtonPressed () {
            Eingabe1_TF.text = ""
            Eingabe2_TF.text = ""
            Eingabe3_TF.text = ""
            Formel_LF.text = ""
            Ergebnis_Label.text = NSLocalizedString("Ergebnis_Label", comment:"Ergebnis_Label")
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
		
		override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
			super.touchesBegan(touches, with: event)
        }
        
		override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
			if motion == .motionShake{
                clearButtonPressed()
            }
        }
        
        
		func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true);
            return false;
        }
        
        
		func textFieldShouldClear(_ textField: UITextField) -> Bool {
            checkEingabe()
			Solutionphrase()
            return true
        }
        
        
		func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
			textField.text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
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
			let zahl1_formel = zahl1_hilfe.replacingOccurrences(of: ",", with: ".")
			let zahl1 = NSString (string: zahl1_formel).doubleValue

			
			let zahl2_hilfe = NSString (string:Eingabe2_TF.text!)
			let zahl2_formel = zahl2_hilfe.replacingOccurrences(of: ",", with: ".")
			let zahl2 = NSString (string: zahl2_formel).doubleValue
			
			let zahl3_hilfe = NSString (string:Eingabe3_TF.text!)
			let zahl3_formel = zahl3_hilfe.replacingOccurrences(of: ",", with: ".")
			let zahl3 = NSString (string: zahl3_formel).doubleValue
			            
			if Eingabe1_TF.text!.lengthOfBytes(using: String.Encoding.ascii) == 0 {
                self.Formel_LF.text = NSLocalizedString("Eingabe_1", comment: "Eingabe 1 ist leer")
                return
            } else if
                
				Eingabe2_TF.text!.lengthOfBytes(using: String.Encoding.ascii) == 0 {
                    Formel_LF.text = NSLocalizedString("Eingabe_2", comment: "Eingabe 2 ist leer")
                    return
            } else if
                
				Eingabe3_TF.text!.lengthOfBytes(using: String.Encoding.ascii) == 0 {
                    Formel_LF.text = NSLocalizedString("Eingabe_3", comment: "Eingabe 3 ist leer")
                    return
            }
            
            
			Ergebnis_Label.text = String(format: "%.2f", locale:Locale.current, (zahl2 * zahl1) / zahl3)
			Formel_LF.text = "(\(zahl2) * \(zahl1))  / \(zahl3) =  " + Ergebnis_Label.text!
			
			

				
				
//		objCType;: Solutionphrase()
		Solutionphrase()
		}
		

		
//
		var numberFormatter: NumberFormatter {
			let formatter = NumberFormatter()
			formatter.numberStyle = .decimal

			return formatter
		}
        
        
        
        
        
    }
