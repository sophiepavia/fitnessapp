//
//  WorkoutSelection.swift
//  fitnessApp
//
//  Created by Jack Garthwaite on 2/19/21.
//

import UIKit

class WorkoutSelection: UIViewController {

    // MARK: Properties
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var insertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        // Do any additional setup after loading the view.
    }
    func configureButtons()
    {//making the buttons circular
    
        insertButton.layer.cornerRadius = 0.5 * insertButton.bounds.size.width
        insertButton.clipsToBounds = true
        
       customButton.layer.cornerRadius = 0.5 * customButton.bounds.size.width
       customButton.clipsToBounds = true
    }
}
