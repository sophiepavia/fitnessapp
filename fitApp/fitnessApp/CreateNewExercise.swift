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
    
    
    @IBOutlet weak var ExerciseName: UITextField!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var Focus: UITextField!
    @IBOutlet weak var Sets: UITextField!
    @IBOutlet weak var Reps: UITextField!
    
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
    
    @IBAction func createNewExerciseButton(_ sender: Any) {
        let url = NSURL(string: "https://chickfila-tally.net/recieve.php") // locahost MAMP - change to point to your database server
        
        var request = URLRequest(url: url! as URL)
                request.httpMethod = "POST"
                
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        
// the POST string has entries separated by &

        dataString = dataString + "&item1=\(ExerciseName.text ?? " ")" // add items as name
        dataString = dataString + "&item2=\(Weight.text ?? " ")"
        dataString = dataString + "&item3=\(Reps.text ?? " ")"
        dataString = dataString + "&item4=\(Sets.text ?? " ")"
        dataString = dataString + "&item5=\(Focus.text ?? " ")"
        dataString = dataString + "&item6=\(Description.text ?? " ")"
        
        // convert the post string to utf8 format
                
        let dataD = dataString.data(using: .utf8) // convert to utf8 string
        
        do
               {
               
       // the upload task, uploadJob, is defined here

                   let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
                   {
                       data, response, error in
                       
                       if error != nil {
                           
       // display an alert if there is an error inside the DispatchQueue.main.async

                           DispatchQueue.main.async
                           {
                                   let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                                   alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                   self.present(alert, animated: true, completion: nil)
                           }
                       }
                       else
                       {
                           if let unwrappedData = data {
                               
                               let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database
                               
                               if returnedData == "1" // insert into database worked
                               {

       // display an alert if no error and database insert worked (return = 1) inside the DispatchQueue.main.async

                                   DispatchQueue.main.async
                                   {
                                       let alert = UIAlertController(title: "Upload OK?", message: "Looks like the upload and insert into the database worked.", preferredStyle: .alert)
                                       alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                       self.present(alert, animated: true, completion: nil)
                                   }
                               }
                               else
                               {
       // display an alert if an error and database insert didn't worked (return != 1) inside the DispatchQueue.main.async

                                   DispatchQueue.main.async
                                   {

                                   let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not worked.", preferredStyle: .alert)
                                   alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                   self.present(alert, animated: true, completion: nil)
                                   }
                               }
                           }
                       }
                   }
                   uploadJob.resume()
               }
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
