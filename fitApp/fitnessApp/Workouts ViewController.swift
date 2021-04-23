//
//  Workouts ViewController.swift
//  fitnessApp
//
//  Created by Sydney m on 4/18/21.
//

import UIKit

class Workouts_ViewController: UIViewController {
    
    @IBOutlet weak var BodyLabel: UILabel!
    
    let bodyparts = [
        "Legs", "Arms", "Biceps", "Triceps", "Chest", "Traps", "Glutes", "Hamstrings", "Calves", "Abs"
    ]
    let number = Int.random(in: 0..<9)
    
    func assignbackground(){
          let background = UIImage(named: "victor-freitas-JbI04nYfaJk-unsplash")
          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubviewToBack(imageView)
      }
    
    override func viewDidLoad() {
        BodyLabel.text = bodyparts[number]
        super.viewDidLoad()
        assignbackground()

       
    }

}
