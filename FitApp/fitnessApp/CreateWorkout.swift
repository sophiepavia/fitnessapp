//
//  CreateWorkout.swift
//  fitnessApp
//
//  Created by Jack Garthwaite on 2/19/21.
//

import UIKit

class CreateWorkout: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: Properties
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Area: UIPickerView!
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Reps: UITextField!
    @IBOutlet weak var Modifications: UITextField!
    @IBOutlet weak var Description: UITextField!
    var pickerData:[String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["Arms", "Legs", "Abs", "Glutes"]
        // Do any additional setup after loading
        // the view.
        // Connect data:
              self.Area.delegate = self
              self.Area.dataSource = self
              
              // Input the data into the array
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //scrolling view of body parts
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    // The data to return for the row and
    // component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            // This method is triggered whenever the user makes a change to the picker selection.
            // The parameter named row and component represents what was selected.
        }
   
        // Do any additional setup after loading the view.
}
