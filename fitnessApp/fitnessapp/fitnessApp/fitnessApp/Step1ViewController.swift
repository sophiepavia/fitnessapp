//
//  Step1ViewController.swift
//  fitnessApp
//
//  Created by Sophie Pavia on 2/13/21.
//

import UIKit

class Step1ViewController: UIViewController {
    
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
    }
    
    @IBAction func femaleAction(_ sender: Any)
    {
        gender = "Female"
    }
    
    @IBAction func otherAction(_ sender: Any)
    {
        gender = "Other"
    }
}
