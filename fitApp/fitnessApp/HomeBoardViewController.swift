//
//  HomeBoardViewController.swift
//  fitnessApp
//
//  Created by Henry Gilbert on 3/6/21.
//

import UIKit

class HomeBoardViewController: UIViewController {
    
    
    let userDefaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Button(_ sender: Any) {
        if (userDefaults.value(forKey: "WEIGHT") != nil){
    
            let story = UIStoryboard(name: "Main", bundle: nil)
                  let controller = story.instantiateViewController(identifier: "ProfileHome") as! UIViewController
                  self.present(controller, animated: true, completion: nil)
           }
        
        else{
            let story = UIStoryboard(name: "Main", bundle: nil)
                  let controller = story.instantiateViewController(identifier: "InitNav") as! UINavigationController
                  self.present(controller, animated: true, completion: nil)
           }
        
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
