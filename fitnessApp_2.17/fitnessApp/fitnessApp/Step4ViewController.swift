//
//  Step4ViewController.swift
//  fitnessApp
//
//  Created by Henry Gilbert on 2/19/21.
//

import UIKit

class Step4ViewController: UIViewController {


    @IBOutlet weak var weightInput: UITextField!
    @IBOutlet weak var repsInput: UITextField!
    @IBOutlet weak var labelOutput: UILabel!
   
    @IBAction func calculateButton(_ sender: Any) {
        labelOutput.text = String("hello")
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
                view.addGestureRecognizer(tap) // Add gesture recognizer to background view
        
        // Do any additional setup after loading the view.
    }
    
    @objc func handleTap() {
        weightInput.resignFirstResponder() // dismiss keyoard
        repsInput.resignFirstResponder() // dismiss keyoard
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
