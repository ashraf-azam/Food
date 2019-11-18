//
//  FoodTableCell.swift
//  FoodApp
//
//  Created by Ashraf on 09/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import UIKit

class FoodTableCell: UITableViewCell {
    @IBOutlet weak var img_view: UIImageView!
    @IBOutlet weak var food_title: UILabel!
    
    var food: Food! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        img_view.layer.cornerRadius = 5.0
        img_view.layer.masksToBounds = true
        img_view.image = UIImage(named: food.imageName)
        food_title.text = food.name
    }

}
