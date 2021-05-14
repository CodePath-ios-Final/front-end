//
//  RecipeDetailsViewController.swift
//  YumMe
//
//  Created by Colleen Ponraj on 5/11/21.
//

import UIKit
import Firebase
import Alamofire
import AlamofireImage

class RecipeDetailsViewController: UIViewController {
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var recipeInstructions: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientsList: UILabel!
    @IBOutlet weak var prepTime: UILabel!
    @IBOutlet weak var ingredientsView: UIView!
    var recipe: [String:Any]!
    var db : Firestore!
    var docRef : DocumentReference!
    let dietaryPreference = "Vegan"
    var recipesdb = [DocumentSnapshot]()
    //var allIngredients: [EachIngredient] = []
    //var ingredients:[Name: String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //print(recipe["recipeName"]!)
        ingredientsView.layer.cornerRadius = 15
        ingredientsList.layer.cornerRadius = 15
        recipeName.text = recipe["recipeName"] as? String
        recipeImage.sizeToFit()
        recipeDescription.text = recipe["recipeDescription"] as? String
        recipeDescription.sizeToFit()
        //recipeInstructions.text = recipe["instructions"] as? String
        // Fetching recipe instructions
        Firestore.firestore().collection("Recipes").document("EHyenkQfCs1x1yPOgJHL").getDocument {
            (document, error) in
            if let document = document {
                let instructionGroup_array = document["instructions"] as? Array ?? [""]
                //print(instructionGroup_array)
                self.recipeInstructions.numberOfLines = 0
                self.recipeInstructions.attributedText = bulletPointList(strings: instructionGroup_array)
                self.recipeInstructions.sizeToFit()
            }
        }
        
        prepTime.text = recipe["cookTime"] as? String
        
        //ingredientsList.text = recipe["ingredients"] as? String
        //Fetching ingredients from a firestore db map onject
        //var allIngredients: [EachIngredient] = []
        
        //let db1 = Firestore.firestore()
        Firestore.firestore().collection("Recipes").document("EHyenkQfCs1x1yPOgJHL").getDocument {
            (document, error) in
             if let err = error {
                 print("Error getting documents: \(err)")tr
             } else {
                if let document = document?.data(),
                    let doc = document["ingredients"]["ingredientName"] as? String {
                    print(doc)
                    for info in doc{
                       // print(info)
                        
                        
                      //  if let ing2 = doc1
                    }
                   /* let ingName = doc["ingredientName"] as? Array ?? [""]
                    print(ingName)
                    self.ingredientsList.numberOfLines = 0
                    self.ingredientsList.attributedText = bulletPointList(strings: ingName)
                    self.ingredientsList.sizeToFit()
                        */
                    }
             }
        }
               
       /* db1.collection("Recipes").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else if let querySnapshot = querySnapshot {
                for ingredient in querySnapshot.documents {
                    let ingredients = ingredient.data()
                    if let ingredientData = ingredients["ingredients"] as? [String: Any] {
                        let firstName = ingredientData["ingredientName"] as? Array ?? [""]
                        print(firstName)
                        self.ingredientsList.numberOfLines = 0
                        self.ingredientsList.attributedText = bulletPointList(strings: firstName)
                        self.ingredientsList.sizeToFit()
                    }
                }
            }
        }*/

        func bulletPointList(strings: [String]) -> NSAttributedString {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.headIndent = 15
            paragraphStyle.minimumLineHeight = 22
            paragraphStyle.maximumLineHeight = 22
            paragraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: 15)]

           let stringAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ]

            let string = strings.map({ "•\t\($0)" }).joined(separator: "\n")

            return NSAttributedString(string: string,attributes: stringAttributes)
        }

        // change variable to dietary preference from the user
        let dietaryPreference = "Vegan"
        var recipesdb = [DocumentSnapshot]()
        //clear array from past recipes to get the 3 new recipes from firebase
        recipesdb.removeAll()
        Firestore.firestore().collection("Recipes").whereField("dietaryPreferences", isEqualTo: dietaryPreference)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.recipesdb = querySnapshot!.documents
                    for document in querySnapshot!.documents {
                        self.recipesdb.append(document)
                        
                    }
                
                }
        //setting recipe picture using alamofire
                var urlString1 = self.recipesdb[0].data()!["recipePhoto"] as! String
                var url = URL(string: urlString1)!
                self.recipeImage.af_setImage(withURL: url)

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
}
