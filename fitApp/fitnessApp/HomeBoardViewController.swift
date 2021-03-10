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
    @IBOutlet weak var disconnectButton: UIButton!
    
    let userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    GIDSignIn.sharedInstance()?.presentingViewController = self

    // Automatically sign in the user
    GIDSignIn.sharedInstance()?.restorePreviousSignIn()

      NotificationCenter.default.addObserver(self,
        selector: #selector(HomeBoardViewController.receiveToggleAuthUINotification(_:)),
        name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
        object: nil)

    statusText.text = "Initialized Swift app..."
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
    statusText.text = "Signed out."
    toggleAuthUI()
    }

    //If the user clicks disconnect
    @IBAction func didTapDisconnect(_ sender: AnyObject) {
    GIDSignIn.sharedInstance().disconnect()

    statusText.text = "Disconnecting."

    }

    func toggleAuthUI() {
    if let _ = GIDSignIn.sharedInstance()?.currentUser?.authentication
    {
      // Signed in
      signInButton.isHidden = true
      signOutButton.isHidden = false
      disconnectButton.isHidden = false
      }
      else {
      signInButton.isHidden = false
      signOutButton.isHidden = true
      disconnectButton.isHidden = true
      statusText.text = "Google Sign in\niOS Demo"
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
        self.statusText.text = userInfo["statusText"]!
      }
    }
  }
    // Everything above this line is related to the Google API
    // --------------------------------------------------------

      @IBAction func Button(_ sender: Any) {
        if (userDefaults.value(forKey: "WEIGHT") != nil){
    
            let story = UIStoryboard(name: "Main", bundle: nil)
                  let controller = story.instantiateViewController(identifier: "Home") as! UIViewController
                  self.present(controller, animated: true, completion: nil)
           }
        
        else{
            let story = UIStoryboard(name: "Main", bundle: nil)
                  let controller = story.instantiateViewController(identifier: "InitNav") as! UINavigationController
                  self.present(controller, animated: true, completion: nil)
           }
    }
}
