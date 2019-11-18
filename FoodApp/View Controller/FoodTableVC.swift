//
//  FoodTableVC.swift
//  FoodApp
//
//  Created by Ashraf on 09/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import UIKit

class FoodTableVC: UITableViewController {
    
    let foods = Bundle.main.decode([Food].self, from: "recipe.json")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(foods)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodTableCell
        let food = foods[indexPath.row]
        cell.food = food
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: (indexPath), animated: true)
        let food = foods[indexPath.row]
        Global.shareInstance().title = food.name;
        Global.shareInstance().imageFood = UIImage(named:food.imageName)!
        Global.shareInstance().ingredients = food.ingredients
        Global.shareInstance().category = food.category
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}
