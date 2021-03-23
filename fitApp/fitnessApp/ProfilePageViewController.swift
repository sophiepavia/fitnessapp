//
//  ProfilePageViewController.swift
//  fitnessApp
//
//  Created by Sophie Pavia on 3/23/21.
//

import UIKit

class ProfilePageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet var imageVIew: UIImageView!
    @IBAction func imagePicker(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        
        self.present(picker, animated: true)
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
        title = "Update Profile Pic"
        
        let data = UserDefaults.standard.object(forKey: "savedImage") as! NSData
        imageVIew.image = UIImage(data: data as Data)
        imageVIew.layer.borderWidth = 1
        imageVIew.layer.masksToBounds = false
        imageVIew.layer.borderColor = UIColor.black.cgColor
        imageVIew.layer.cornerRadius = imageVIew.frame.height/2
        imageVIew.clipsToBounds = true
    
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
