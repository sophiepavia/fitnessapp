//
//  Step2ViewController.swift
//  fitnessApp
//
//  Created by Sydney m on 2/15/21.
//

import UIKit

class Step2ViewController: UIViewController {

    let userDefaults = UserDefaults()
    var bodyPart: String = ""
    //MARK: Properties
    
    @IBOutlet weak var gluteButton: UIButton!
    @IBOutlet weak var absButton: UIButton!
    @IBOutlet weak var legButton: UIButton!
    @IBOutlet weak var armButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions
    
    @IBAction func armAction(_ sender: Any)
    {
        bodyPart = "arm"
        userDefaults.setValue(bodyPart, forKey: "BODYPART")
    }
    
    @IBAction func legAction(_ sender: Any)
    {
        bodyPart = "leg"
        userDefaults.setValue(bodyPart, forKey: "BODYPART")
    }
    
    @IBAction func absAction(_ sender: Any)
    {
        bodyPart = "abs"
        userDefaults.setValue(bodyPart, forKey: "BODYPART")
    }
    @IBAction func gluteAction(_ sender: Any)
    {
        bodyPart = "glutes"
        userDefaults.setValue(bodyPart, forKey: "BODYPART")
    }
}
