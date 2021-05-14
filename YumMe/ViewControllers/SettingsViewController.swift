//
//  SettingsViewController.swift
//  YumMe
//
//  Created by Laura Hernandez on 4/16/21.
//

import UIKit
import GoogleSignIn

class SettingsViewController: UIViewController, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        if let error = error {
//            print(error.localizedDescription)
//            return
//        }
//        let authentication = user.authentication
        
    }
    
    @IBOutlet weak var updateProfileButton: UIButton!
    @IBOutlet weak var updateDietButton: UIButton!
    @IBOutlet weak var updatePantryButton: UIButton!
    @IBOutlet weak var recipeHistoryButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func onLogoutTap(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        print("Sign-out clicked")
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        performSegue(withIdentifier: "ToLogin", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateProfileButton.layer.cornerRadius = 15
        updateDietButton.layer.cornerRadius = 15
        updatePantryButton.layer.cornerRadius = 15
        recipeHistoryButton.layer.cornerRadius = 15
        logoutButton.layer.cornerRadius = 15
        
        // Do any additional setup after loading the view.
    }
    

    

}
