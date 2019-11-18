//
//  Food.swift
//  FoodApp
//
//  Created by Ashraf on 09/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

struct Food: Decodable {
    var id: Int
    var name: String
    var imageName: String
    var ingredients: String
    var category: String
}
