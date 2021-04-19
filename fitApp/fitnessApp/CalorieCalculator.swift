//
//  CalorieCalculator.swift
//  fitnessApp
//
//  Created by Alex Serrano on 2/20/21.
//

import UIKit

class CalorieCalculator: UIViewController, UIPickerViewDataSource, UIPickerViewAccessibilityDelegate {
    
    //MARK: Properties
    @IBOutlet weak var bodyWeight: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var bodyFat: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activity: UIPickerView!
    
    
    func assignbackground(){
          let background = UIImage(named: "Hexagon background")
          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubviewToBack(imageView)
      }
    
    //levels of activity
    let activities = ["Very Light", "Light", "Moderate", "Heavy", "Very Heavy"]
    var activityChoice : String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    //scrolling view of the level of activity
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
        
        bodyWeight.text = globalWeight
        
        bodyFat.delegate = self
        // Do any additional setup after loading
        // the view.
        assignbackground()
    }
    
    //male or female
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
        
        // Check if the text fields are empty, if they are, ask for user to input value
        if bodyWeight.text! == "" || bodyFat.text! == ""
        {
            var field = ""
            if bodyWeight.text! == ""
            {
                field = "Weight (lbs)"
            }
            else if bodyFat.text! == ""
            {
                field = "Body Fat"
            }
            
            let alert = UIAlertController(title: "Notification", message: "Input required for the '\(field)' field", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {action in
                print("tapped Oaky")
            }))
            
            present(alert, animated: true)
            
            return
        }
        
        let weight : Float? = Float(bodyWeight.text!)
        let genderNumber : Int = genderValue(gender)
        let weightKg = weight!/2.2
        var multiplyValue : Float = 0.0
        
        //using the algorthim based on if the
        //user is male or female
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
        
        //calculaing lean factor based on if
        //the user is male or female
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
        
        //assigning numerical values to activity
        //level of the user
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
        
        //calculaing number of calories the user
        //needs to consume per day to maintain
        //their current weight
        let total2 = total1 * leanFactor * activityValue
        
        //printing and also calculating number
        //of calories user needs to consume
        //per day to moderately and rapidly
        //lose weight
        textView.text = "Calories per day to...\nMAINTAIN weight: \(Int(total2))\nMODERATELY LOSE weight (0.5 lb/week): \(Int(total2*0.9)) \nLOSE weight (1.0 lb/week): \(Int(total2*0.8))\nRAPIDLY LOSE weight (2.0 lb/week) \(Int(total2*0.61))"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bodyWeight.resignFirstResponder()
        bodyFat.resignFirstResponder()
    }
}

extension CalorieCalculator : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
