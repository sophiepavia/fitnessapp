//
//  WorkoutSelection.swift
//  fitnessApp
//
//  Created by Jack Garthwaite on 2/19/21.
//

import UIKit

class WorkoutSelection: UIViewController {

    
    @IBOutlet weak var Insert: UIButton!
    @IBOutlet weak var Custom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        // Do any additional setup after loading the view.
    }
    func configureButtons()
    {
        Insert.layer.cornerRadius = 0.5 * Insert.bounds.size.width
       // Insert.clipsToBounds = true
        
       Custom.layer.cornerRadius = 0.5 * Custom.bounds.size.width
       //Custom.clipsToBounds = true
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
