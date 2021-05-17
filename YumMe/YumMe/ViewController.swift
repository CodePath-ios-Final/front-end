//
//  ViewController.swift
//  YumMe
//
//  Created by Colleen Ponraj on 3/27/21.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let unwrappedUser = user {
            print("Performing signing in for the user at \(unwrappedUser.profile.email!)")
            performSegue(withIdentifier: "ToDietaryPlan", sender: self)
            
        }
        else {
            print("Failed to login: No email found")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // clean up after log out
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    

    @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.clientID = "224711502779-4u8cdk4945qedggafv366sikvielodr6.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        if GIDSignIn.sharedInstance() != nil {
            // signed in
            print("Hello I'm signed in")
        }
        else {
            GIDSignIn.sharedInstance().signIn()
        }
    }
}
