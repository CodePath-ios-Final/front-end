//
//  HistoryViewController.swift
//  YumMe
//
//  Created by Laura Hernandez on 4/16/21.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var historyTableView: UITableView!
    var recipes = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.dataSource = self
        historyTableView.delegate = self
        
        //get information from firebase into recipes array
        
        historyTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return number of recipes
        recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //configure cell
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "HistoryRecipeCell") as! HistoryRecipeTableViewCell
        let recipe = recipes[indexPath.row]
        let name = recipe["name"] as! String
        let rating = recipe["rating"] as! Int
        cell.name.text = name
        
        //get image use alamo fire
        
        
        
        return cell
    }

}
