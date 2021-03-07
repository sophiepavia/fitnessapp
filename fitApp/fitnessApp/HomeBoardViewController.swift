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
    
   
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var disconnectButton: UIButton!
    
    let userDefaults = UserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    GIDSignIn.sharedInstance()?.presentingViewController = self

    // Automatically sign in the user.
    GIDSignIn.sharedInstance()?.restorePreviousSignIn()

    NotificationCenter.default.addObserver(self,
        selector: #selector(HomeBoardViewController.receiveToggleAuthUINotification(_:)),
        name: NSNotification.Name(rawValue: "ToggleAuthUINotification"),
        object: nil)

    statusText.text = "Initialized Swift app..."
    toggleAuthUI()
  }

    
  @IBAction func didTapSignOut(_ sender: AnyObject) {
    GIDSignIn.sharedInstance().signOut()
    statusText.text = "Signed out."
    toggleAuthUI()
  }

  @IBAction func didTapDisconnect(_ sender: AnyObject) {
    GIDSignIn.sharedInstance().disconnect()

    statusText.text = "Disconnecting."

  }

  func toggleAuthUI() {
    if let _ = GIDSignIn.sharedInstance()?.currentUser?.authentication {
      // Signed in
      signInButton.isHidden = true
      signOutButton.isHidden = false
      disconnectButton.isHidden = false
    } else {
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
    
    // ------------------------------------------

    @IBAction func Button(_ sender: Any) {
        if (userDefaults.value(forKey: "WEIGHT") != nil){
    
            let story = UIStoryboard(name: "Main", bundle: nil)
                  let controller = story.instantiateViewController(identifier: "ProfileHome") as! UIViewController
                  self.present(controller, animated: true, completion: nil)
           }
        
        else{
            let story = UIStoryboard(name: "Main", bundle: nil)
                  let controller = story.instantiateViewController(identifier: "InitNav") as! UINavigationController
                  self.present(controller, animated: true, completion: nil)
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
