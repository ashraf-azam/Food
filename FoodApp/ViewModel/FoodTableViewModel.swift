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
    let sharedData = global.sharedInstance
    
    //save selected cell globally to view in DetailVC
    func setSelectedItem(name:String, ingredients:String, category:String, imageName:UIImage) {
        sharedData.title = name
        sharedData.ingredients = ingredients
        sharedData.category = category
        sharedData.imageFood = imageName
    }
    
    func getImage() -> UIImage {
        return sharedData.imageFood
    }
    
    func getItem(text: String) -> String {
        if text == "title" {
            return sharedData.title
        }
        else if text == "ingredients" {
            return sharedData.ingredients
        }
        else {
            return sharedData.category
        }
    }
}
