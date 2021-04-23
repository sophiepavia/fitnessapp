//
//  Main ViewController.swift
//  fitnessApp
//
//  Created by Sydney m on 4/19/21.
//

import UIKit

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}


class Main_ViewController: UIViewController {
    
    @IBOutlet weak var QuoteLabel: UILabel!
    let inspire = [
        "Mind over Matter", "The Worst Workout Is The One That Didn't Happen", "No Excuses Just Do The Work", "If Its Easy Then You're Doing It Wrong", "When You Feel Like Quitting, Think About Why You Started", "If Your Dreams Don’t Scare You They Are Too Small",
            "Doubt Kills More Dreams Than Failure Ever Will", "Don’t Limit Your Challenges. Challenge Your Limits."
        
        
    ]
    
    
    
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
    override func viewDidLoad() {
        let date = Date()
        
        let components = date.get(.day, .month, .year)
        
        if let day = components.day, let month = components.month, let year = components.year {
            QuoteLabel.text = inspire[day%8]
            print("day: \(day), month: \(month), year: \(year)")
        }
        super.viewDidLoad()
        assignbackground()
    }
    
   

}
