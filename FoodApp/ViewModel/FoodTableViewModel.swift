//
//  FoodTableViewModel.swift
//  FoodApp
//
//  Created by HISB-Ashraf Azam on 04/02/2020.
//  Copyright © 2020 Ashraf. All rights reserved.
//

import Foundation

class FoodTableViewModel {
    let foods = Bundle.main.decode([Food].self, from: "recipe.json")
    
    //save selected cell globally to view in DetailVC
    func setGlobalItem(name:String, ingredients:String, category:String, imageName:UIImage) {
        let sharedData = global.sharedInstance
        sharedData.title = name
        sharedData.ingredients = ingredients
        sharedData.category = category
        sharedData.imageFood = imageName
    }
}
