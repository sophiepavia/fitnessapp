//
//  InsertWorkout.swift
//  fitnessApp
//
//  Created by Jack Garthwaite on 2/18/21.
//

import UIKit

class InsertWorkout: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Reps: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var Feeling: UISlider!
    var pickerData:[String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["Arms", "Legs", "Abs", "Glutes"]
        // Do any additional setup after loading the view.
        // Connect data:
              self.picker.delegate = self
              self.picker.dataSource = self
              
              // Input the data into the array
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            // This method is triggered whenever the user makes a change to the picker selection.
            // The parameter named row and component represents what was selected.
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
