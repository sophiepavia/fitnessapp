//
//  Step3ViewController.swift
//  fitnessApp
//
//  Created by Sydney m on 2/16/21.
//

var globalHeight = ""
var globalWeight = ""
import UIKit

class Step3ViewController: UIViewController {

    //MARK: Properties
    let userDefaults = UserDefaults()
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var heightText: UITextField!
   
    
    func assignbackground(){
          let background = UIImage(named: "Hexagon background")
          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubviewToBack(imageView)
      }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        assignbackground()
        
        if let savedWeight = userDefaults.value(forKey: "WEIGHT") as? String {
            weightText.text = savedWeight
        }
        
        if let savedHeight = userDefaults.value(forKey: "HEIGHT") as? String {
            heightText.text = savedHeight
        }
        
    }
    
    @IBAction func button(_ sender: Any) {
        
        globalWeight = weightText.text!
        globalHeight = heightText.text!
        
        userDefaults.setValue(weightText.text, forKey: "WEIGHT")
        userDefaults.setValue(heightText.text, forKey: "HEIGHT")
        
        let url = NSURL(string: "https://chickfila-tally.net/recieve.php") // locahost MAMP - change to point to your database server
        
        var request = URLRequest(url: url! as URL)
                request.httpMethod = "POST"
                
        var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
        
// the POST string has entries separated by &

        dataString = dataString + "&item1=\("Hello")" // add items as name and value
        dataString = dataString + "&item2=\("this")"
        dataString = dataString + "&item3=\("is")"
        dataString = dataString + "&item4=\("a")"
        dataString = dataString + "&item5=\("test")"
        
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
        
    }
    
   
   
    
}
