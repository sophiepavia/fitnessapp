//
//  CalorieCalculator.swift
//  fitnessApp
//
//  Created by Alex Serrano on 2/20/21.
//

import UIKit

class CalorieCalculator: UIViewController, UIPickerViewDataSource, UIPickerViewAccessibilityDelegate {
    
    @IBOutlet weak var bodyWeight: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var bodyFat: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activity: UIPickerView!
    
    let activities = ["Very Light", "Light", "Moderate", "Heavy", "Very Heavy"]
    var activityChoice : String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return activities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activityChoice = activities[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyWeight.delegate = self
        bodyFat.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func genderValue(_ sender: UISegmentedControl) -> Int
    {
        switch sender.selectedSegmentIndex {
        case 0:
            return 1
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    @IBAction func submit(_ sender: Any) {
        let weight : Float? = Float(bodyWeight.text!)
        let genderNumber : Int = genderValue(gender)
        let weightKg = weight!/2.2
        var multiplyValue : Float = 0.0
        
        if genderNumber == 1
        {
            multiplyValue = 1.0
        }
        else if genderNumber == 2
        {
            multiplyValue = 0.9
        }
        
        let total1 = weightKg * multiplyValue * 24.0
        
        let fat : Int? = Int(bodyFat.text!)
        var leanFactor : Float = 0.0
        
        if genderNumber == 1
        {
            if fat! <= 14
            {
                leanFactor = 1.0
            }
            else if fat! > 14  && fat! <= 20
            {
                leanFactor = 0.95
            }
            else if fat! > 20  && fat! <= 28
            {
                leanFactor = 0.90
            }
            else
            {
                leanFactor = 0.85
            }
        }
        else if genderNumber == 2
        {
            if fat! <= 18
            {
                leanFactor = 1.0
            }
            else if fat! > 18  && fat! <= 28
            {
                leanFactor = 0.95
            }
            else if fat! > 28  && fat! <= 38
            {
                leanFactor = 0.90
            }
            else
            {
                leanFactor = 0.85
            }
        }
        
        var activityValue : Float = 1.55
        
        if activityChoice == "Very Light"
        {
            activityValue = 1.3
        }
        else if activityChoice == "Light"
        {
            activityValue = 1.55
        }
        else if activityChoice == "Moderate"
        {
            activityValue = 1.65
        }
        else if activityChoice == "Heavy"
        {
            activityValue = 1.80
        }
        else if activityChoice == "Very Heavy"
        {
            activityValue = 2.0
        }
        
        
        let total2 = total1 * leanFactor * activityValue
        
        textView.text = "Calories per day to...\nMAINTAIN weight: \(Int(total2))\nMODERATELY LOSE weight (0.5 lb/week): \(Int(total2*0.9)) \nLOSE weight (1.0 lb/week): \(Int(total2*0.8))\nRAPIDLY LOSE weight (2.0 lb/week) \(Int(total2*0.61))"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bodyWeight.resignFirstResponder()
        bodyFat.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CalorieCalculator : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
