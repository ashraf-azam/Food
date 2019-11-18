//
//  Data.swift
//  FoodApp
//
//  Created by Ashraf on 18/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil)
            else {
                fatalError("Could not find \(file) in main bundle.")
        }
        
        guard let data = try? Data(contentsOf: url)
            else {
                fatalError("Could not load \(file) in main bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data)
            else {
                fatalError("Could not decode \(file) in main bundle.")
        }
        
        return loaded
    }
}
