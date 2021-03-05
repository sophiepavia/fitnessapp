//
//  ViewController.swift
//  fitnessApp
//
//  Created by Sophie Pavia on 2/13/21.
//

import UIKit
import GoogleSignIn

@objc(ViewController)

class ViewController: UIViewController {
    
    //MARK: Properties
    
 
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var disconnectButton: UIButton!
    @IBOutlet weak var statusText: UILabel!
    
    override func viewDidLoad() {
      super.viewDidLoad()

      GIDSignIn.sharedInstance()?.presentingViewController = self

      // Automatically sign in the user.
      GIDSignIn.sharedInstance()?.restorePreviousSignIn()

      NotificationCenter.default.addObserver(self,
          selector: #selector(ViewController.receiveToggleAuthUINotification(_:)),
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
}

