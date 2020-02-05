//
//  FoodTableVC.swift
//  FoodApp
//
//  Created by Ashraf on 09/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import UIKit

class FoodTableVC: UITableViewController {
    let dataVM = FoodTableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataVM.foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodTableCell
        let food = dataVM.foods[indexPath.row]
        cell.food = food
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: (indexPath), animated: true)
        let food = dataVM.foods[indexPath.row]
        
        let detailsVC = DetailVC()
        detailsVC.selectedFood = [dataVM.foods[indexPath.row]]
        
        dataVM.setSelectedItem(name: food.name, ingredients: food.ingredients, category: food.category, imageName: UIImage(named:food.imageName)!)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}
