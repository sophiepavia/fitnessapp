//
//  Step3ViewController.swift
//  fitnessApp
//
//  Created by Sydney m on 2/16/21.
//

var globalHeight = ""
var globalWeight = ""
import UIKit

class Step3ViewController: UIViewController {

    //MARK: Properties
    let userDefaults = UserDefaults()
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var heightText: UITextField!
   
  
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let savedWeight = userDefaults.value(forKey: "WEIGHT") as? String {
            weightText.text = savedWeight
        }
        
        if let savedHeight = userDefaults.value(forKey: "HEIGHT") as? String {
            heightText.text = savedHeight
        }
        
    }
    
    @IBAction func button(_ sender: Any) {
        
        globalWeight = weightText.text!
        globalHeight = heightText.text!
        
        userDefaults.setValue(weightText.text, forKey: "WEIGHT")
        userDefaults.setValue(heightText.text, forKey: "HEIGHT")
        
    }
    
   
   
    
}
