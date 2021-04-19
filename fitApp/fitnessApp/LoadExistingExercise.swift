//
//  LoadExistingExercise.swift
//  fitnessApp
//
//  Created by Alex Serrano on 3/10/21.
//

import UIKit

class LoadExistingExercise: UIViewController {

    //MARK: Properties

    
    
    @IBOutlet weak var loadExistingExerciseButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var feelingSlider: UISlider!
    //this is so the slider can "snap to" values in
    //increments of 1
    let step:Float = 1
    
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

        //characteristics of the slider
        feelingSlider.minimumValue = 0
        feelingSlider.maximumValue = 3
        feelingSlider.isContinuous = true
        feelingSlider.tintColor = UIColor.white
        assignbackground()
    }
    
    //making the slider snap to values of 0-3
    @IBAction func sliderAction(_ sender: UISlider!) {
        
        let snapToValue = round(sender.value / step) * step
        sender.value = snapToValue
        
        let sliderValue:Float = sender.value
        var sliderWords = ""

            if(sliderValue == 0) {
                sliderWords = "Bad" }

            else if(sliderValue == 1) {
                sliderWords = "Alright" }
            
            else if(sliderValue == 2) {
                sliderWords = "Pretty Good" }

            else if(sliderValue == 3) {
                sliderWords = "Great" }

        label.text = String(sliderWords)
    } //end of sliderAction function
    
    @IBAction func loadExistingExerciseButton(_ sender: Any) {
        showAlert()
    }
    
    func showAlert()
    {
        let alert = UIAlertController(title: "Notification", message: "This exercise has been succesfully added to your workout!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {action in
            print("tapped Done")
        }))
        
        present(alert, animated: true)
    }  //end of show alert function
}  //end of class

