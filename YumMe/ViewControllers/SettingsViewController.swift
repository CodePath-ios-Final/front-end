//
//  SettingsViewController.swift
//  YumMe
//
//  Created by Laura Hernandez on 4/16/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var updateProfileButton: UIButton!
    @IBOutlet weak var updateDietButton: UIButton!
    @IBOutlet weak var updatePantryButton: UIButton!
    @IBOutlet weak var recipeHistoryButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
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
