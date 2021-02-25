//
//  BMIViewController.swift
//  fitnessApp
//
//  Created by Henry Gilbert on 2/25/21.
//

import UIKit

class BMIViewController: UIViewController {

    @IBOutlet weak var outputText: UITextField!
    
    
    override func viewDidLoad() {
       
        
        var weight = Double(globalWeight) ?? 0.0
        var height = Double(globalHeight) ?? 0.0
        let bmi = (weight/(height*height))*703
        
        outputText.text = String(bmi)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
