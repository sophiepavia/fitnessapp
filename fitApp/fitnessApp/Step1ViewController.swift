//
//  Step1ViewController.swift
//  fitnessApp
//
//  Created by Sophie Pavia on 2/13/21.
//

import UIKit

class Step1ViewController: UIViewController {
    let userDefaults = UserDefaults()
    
    // MARK: Properties
    var gender: String = ""
    
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        configureButtons()

    }

    func configureButtons()
    {//making the buttons circular
        
        maleButton.layer.cornerRadius = 0.5 * maleButton.bounds.size.width
        maleButton.clipsToBounds = true
        
        femaleButton.layer.cornerRadius = 0.5 * femaleButton.bounds.size.width
        femaleButton.clipsToBounds = true
        otherButton.layer.cornerRadius = 0.5 * otherButton.bounds.size.width
        otherButton.clipsToBounds = true
    }
 
    //MARK: Actions
    
    @IBAction func maleAction(_ sender: Any)
    {
        gender = "Male"
        userDefaults.setValue(gender, forKey: "BODYPART")
    }
    
    @IBAction func femaleAction(_ sender: Any)
    {
        gender = "Female"
        userDefaults.setValue(gender, forKey: "BODYPART")

    }
    
    @IBAction func otherAction(_ sender: Any)
    {
        gender = "Other"
        userDefaults.setValue(gender, forKey: "BODYPART")

    }
}
