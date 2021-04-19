//
//  NewWorkout.swift
//  fitnessApp
//
//  Created by Alex Serrano on 3/10/21.
//

import UIKit

class NewWorkout: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!

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
        super.viewDidLoad()
        
        let df = DateFormatter()
        df.dateStyle = .short
        
        dateTextField.text = df.string(from: Date())
        assignbackground()

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
