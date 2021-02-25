//
//  Step3ViewController.swift
//  fitnessApp
//
//  Created by Sydney m on 2/16/21.
//

import UIKit

class Step3ViewController: UIViewController {

    //MARK: Properties
    
    
    var height = ""
    var weight = ""
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var heightText: UITextField!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func SumbitButton(_ sender: Any) {
       
        //self.height = heightText.text!
       // self.weight = weightText.text!
        
        //performSegue(withIdentifier: "go", sender: self)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        var vc = segue.destination as!BMIViewController
//
//        vc.finalWeight = self.weight
//        vc.finalHeight = self.height
//    }
//

}
