//
//  Step2ViewController.swift
//  fitnessApp
//
//  Created by Sydney m on 2/15/21.
//

import UIKit

class Step2ViewController: UIViewController {

    var bodyPart: String = ""
    // PROPERTIES
    
    @IBOutlet weak var gluteButton: UIButton!
    @IBOutlet weak var absButton: UIButton!
    @IBOutlet weak var legButton: UIButton!
    @IBOutlet weak var armButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ACTIONS
    
    @IBAction func armAction(_ sender: Any)
    {
        bodyPart = "arm"
    }
    
    @IBAction func legAction(_ sender: Any)
    {
        bodyPart = "leg"
    }
    
    @IBAction func absAction(_ sender: Any)
    {
        bodyPart = "abs"
    }
    @IBAction func gluteAction(_ sender: Any)
    {
        bodyPart = "glutes"
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
