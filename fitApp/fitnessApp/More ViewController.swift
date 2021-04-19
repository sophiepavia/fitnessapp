//
//  More ViewController.swift
//  fitnessApp
//
//  Created by Sydney m on 4/18/21.
//

import UIKit

class More_ViewController: UIViewController {

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
        assignbackground()

       
    }

}
