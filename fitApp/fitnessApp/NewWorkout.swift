//
//  NewWorkout.swift
//  fitnessApp
//
//  Created by Alex Serrano on 3/10/21.
//

import UIKit

class NewWorkout: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let df = DateFormatter()
        df.dateStyle = .short
        
        dateTextField.text = df.string(from: Date())

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
