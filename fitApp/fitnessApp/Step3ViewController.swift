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
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var heightText: UITextField!
   
  
    
    override func viewDidLoad()
    {
        

        super.viewDidLoad()
    }
    
    @IBAction func button(_ sender: Any) {
        
        globalWeight = weightText.text!
        
        globalHeight = heightText.text!
        
    }
    
   
    
}
