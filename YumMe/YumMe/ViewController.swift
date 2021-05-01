//
//  ViewController.swift
//  YumMe
//
//  Created by Colleen Ponraj on 3/27/21.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {

    @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }


}

class GIDSignInButton : UIControl {
    
}

