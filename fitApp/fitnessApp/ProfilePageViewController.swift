//
//  ProfilePageViewController.swift
//  fitnessApp
//
//  Created by Sophie Pavia on 3/23/21.
//

import UIKit

class ProfilePageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet var imageVIew: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBAction func imagePicker(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        
        self.present(picker, animated: true)
    }
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        imageVIew.image = image
        let imageData:NSData = image!.pngData()! as NSData
        
        UserDefaults.standard.set(imageData, forKey: "savedImage")
        
        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
        
        imageVIew.image = UIImage(data: data as Data)

        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        title = "Update Profile Pic"
        
        label1.textColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        label2.textColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        label3.textColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        label4.textColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)

        
        if(UserDefaults.standard.object(forKey: "savedImage") as? NSData != nil)
        {
        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
            imageVIew.image = UIImage(data: data as Data)
            imageVIew.layer.borderWidth = 1
            imageVIew.layer.masksToBounds = false
            imageVIew.layer.borderColor = UIColor.black.cgColor
            imageVIew.layer.cornerRadius = imageVIew.frame.height/2
            imageVIew.clipsToBounds = true
        }
        
    
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
