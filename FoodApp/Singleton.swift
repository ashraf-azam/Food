//
//  Singleton.swift
//  FoodApp
//
//  Created by HISB-Ashraf Azam on 04/02/2020.
//  Copyright © 2020 Ashraf. All rights reserved.
//

import Foundation

class global {
    
    static let sharedInstance = global()
    var title = ""
    var ingredients = ""
    var category = ""
    var imageFood: UIImage = UIImage()
}
