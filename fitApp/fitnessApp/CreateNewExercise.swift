//
//  CreateNewExercise.swift
//  fitnessApp
//
//  Created by Alex Serrano on 3/10/21.
//

import UIKit

class CreateNewExercise: UIViewController {

    @IBOutlet weak var createNewExerciseButton: UIButton!
    @IBOutlet weak var feelingSlider: UISlider!
    @IBOutlet weak var label: UILabel!
    //this is so the slider can "snap to" values in
    //increments of 1
    let step:Float = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //characteristics of the slider
        feelingSlider.minimumValue = 0
        feelingSlider.maximumValue = 3
        feelingSlider.isContinuous = true
        feelingSlider.tintColor = UIColor.white
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
    
    @IBAction func createNewExerciseButton(_ sender: Any) {
        showAlert()
    }
    
    func showAlert()
    {
        let alert = UIAlertController(title: "Notification", message: "This exercise has been succesfully added to your workout!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {action in
            print("tapped Done")
        }))
        
        present(alert, animated: true)
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
