//
//  DetailDescView.swift
//  FoodApp
//
//  Created by Ashraf on 17/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import UIKit

class DetailDescView: UIView {
    @IBOutlet var detail_viewDesc: UIView!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var ingredient: UILabel!
    @IBOutlet weak var ingredientText: UITextView!
    
    let dataVM = FoodTableViewModel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DetailDescView", owner: self, options: nil)
        addSubview(detail_viewDesc)
        self.setText()
        detail_viewDesc.frame = self.bounds
        detail_viewDesc.layer.borderWidth = 0.5
        detail_viewDesc.layer.cornerRadius = 5.0
        detail_viewDesc.layer.masksToBounds = true
        detail_viewDesc.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setText() {
        let sharedData = global.sharedInstance
        title1.text = sharedData.title
        desc.text = sharedData.category
        ingredient.text = "Ingredient"
        ingredientText.text = sharedData.ingredients
    }
    
    //get the text from a function in FoodTableViewModel
//    private func setText() {
//        title1.text = dataVM.getItem(text: "title")
//        desc.text = dataVM.getItem(text: "category")
//        ingredientText.text = dataVM.getItem(text: "ingredients")
//        ingredient.text = "Ingredient"
//    }

}
