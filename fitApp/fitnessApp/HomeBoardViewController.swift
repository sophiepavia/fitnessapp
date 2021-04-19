//
//  HomeBoardViewController.swift
//  fitnessApp
//
//  Created by Henry Gilbert on 3/6/21.
//

import UIKit
import GoogleSignIn

@objc(ViewController)

class HomeBoardViewController: UIViewController {
   
    //MARK: Properties
    
    //nickname for GIDSignIn.sharedInstance()
    var googleSignIn = GIDSignIn.sharedInstance()
    
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var signOutLabel: UILabel!
    
    let userDefaults = UserDefaults()
    
    
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
        super.viewDidLoad()
        assignbackground()
        
    
    GIDSignIn.sharedInstance()?.presentingViewController = self

    // Automatically sign in the user
    GIDSignIn.sharedInstance()?.restorePreviousSignIn()

      NotificationCenter.default.addObserver(self,
        selector: #selector(HomeBoardViewController.receiveToggleAuthUINotification(_:)),
        name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
        object: nil)

    toggleAuthUI()
    }

    //If the user clicks sign in
    @IBAction func didTapSignIn(_ sender: Any)
    {
        self.googleAuthLogin()
    }
    
    //Functionality of the user clicking sign in
    func googleAuthLogin() {
        self.googleSignIn?.signIn()
    }
  
    //If the user clicks sign out
    @IBAction func didTapSignOut(_ sender: AnyObject) {
    GIDSignIn.sharedInstance().signOut()
   
    toggleAuthUI()
    }

    func toggleAuthUI() {
    if let _ = GIDSignIn.sharedInstance()?.currentUser?.authentication
    {
      // Signed in
      signInButton.isHidden = true
        signInLabel.isHidden = true
      signOutButton.isHidden = false
        signOutLabel.isHidden = false
      }
      else {
      signInButton.isHidden = false
        signInLabel.isHidden = false
      signOutButton.isHidden = true
        signOutLabel.isHidden = true
      }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
    return UIStatusBarStyle.lightContent
    }

    deinit {
    NotificationCenter.default.removeObserver(self,
        name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
        object: nil)
    }

    @objc func receiveToggleAuthUINotification(_ notification: NSNotification) {
    if notification.name.rawValue == "ToggleAuthUINotification" {
      self.toggleAuthUI()
      if notification.userInfo != nil {
        guard let userInfo = notification.userInfo as? [String:String] else { return }
      }
    }
  }
    // Everything above this line is related to the Google API
    // --------------------------------------------------------

      @IBAction func Button(_ sender: Any) {
        if (userDefaults.value(forKey: "WEIGHT") != nil){
    
            let story = UIStoryboard(name: "Main", bundle: nil)
                  let controller = story.instantiateViewController(identifier: "Home")
                  self.present(controller, animated: true, completion: nil)
           }
        
        else{
            let story = UIStoryboard(name: "Main", bundle: nil)
                  let controller = story.instantiateViewController(identifier: "InitNav") as! UINavigationController
                  self.present(controller, animated: true, completion: nil)
           }
    }
}
