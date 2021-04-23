//
//  HomeViewController.swift
//  YumMe
//
//  Created by Laura Hernandez on 4/16/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var breakfastView: UIView!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var breakfastRecipeName: UILabel!
    @IBOutlet weak var breakfastPicture: UIImageView!
    @IBOutlet weak var lunchView: UIView!
    @IBOutlet weak var lunchRecipeName: UILabel!
    @IBOutlet weak var lunchPicture: UIImageView!
    @IBOutlet weak var dinnerView: UIView!
    @IBOutlet weak var dinnerRecipeName: UILabel!
    @IBOutlet weak var dinnerPicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        breakfastView.layer.cornerRadius = 15
        lunchView.layer.cornerRadius = 15
        dinnerView.layer.cornerRadius = 15
    }
    

  

}
