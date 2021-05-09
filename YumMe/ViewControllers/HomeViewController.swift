//
//  HomeViewController.swift
//  YumMe
//
//  Created by Laura Hernandez on 4/16/21.
//

import UIKit
import Firebase
import Alamofire
import AlamofireImage

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var breakfastView: UIView!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var breakfastRecipeName: UILabel!
    @IBOutlet weak var breakfastViewButton: UIButton!
    @IBOutlet weak var breakfastPicture: UIImageView!
    @IBOutlet weak var lunchView: UIView!
    @IBOutlet weak var lunchRecipeName: UILabel!
    @IBOutlet weak var lunchPicture: UIImageView!
    @IBOutlet weak var lunchViewButton: UIButton!
    @IBOutlet weak var dinnerView: UIView!
    @IBOutlet weak var dinnerRecipeName: UILabel!
    @IBOutlet weak var dinnerPicture: UIImageView!
    @IBOutlet weak var dinnerViewButton: UIButton!
    
    var db : Firestore!
    var docRef : DocumentReference!
    // change variable to dietary preference from the user
    let dietaryPreference = "Vegan"
    var recipes = [DocumentSnapshot]()
    override func viewDidLoad() {
        super.viewDidLoad()
        breakfastView.layer.cornerRadius = 15
        breakfastViewButton.layer.cornerRadius = 15
        lunchView.layer.cornerRadius = 15
        lunchViewButton.layer.cornerRadius = 15
        dinnerView.layer.cornerRadius = 15
        dinnerViewButton.layer.cornerRadius = 15
        
        //clear array from past recipes to get the 3 new recipes from firebase
        recipes.removeAll()
        
        //Get recipes from the firestore that contain the dietary preference
        Firestore.firestore().collection("Recipes").whereField("dietaryPreferences", isEqualTo: dietaryPreference)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.recipes = querySnapshot!.documents
                    for document in querySnapshot!.documents {
                        self.recipes.append(document)
                        
                    }
                
                }
                //views set after getting information from firebase. this runs in the background so outside of it, the recipes array will be empty
                //set breakfast view
                self.breakfastRecipeName.text = self.recipes[0].data()!["recipeName"] as? String
                //set breakfast picture using alamofire
                var urlString = self.recipes[0].data()!["recipePhoto"] as! String
                var url = URL(string: urlString)!
                self.breakfastPicture.af_setImage(withURL: url)
                
                //set lunch view
                self.lunchRecipeName.text = self.recipes[1].data()!["recipeName"] as? String
                //set lunch picture
                urlString = self.recipes[1].data()!["recipePhoto"] as! String
                url = URL(string: urlString)!
                self.lunchPicture.af_setImage(withURL: url)
                
                //set dinner view
                self.dinnerRecipeName.text = self.recipes[2].data()!["recipeName"] as? String
                urlString = self.recipes[2].data()!["recipePhoto"] as! String
                url = URL(string: urlString)!
                self.dinnerPicture.af_setImage(withURL: url)
        }
        }
    
    
}
    

