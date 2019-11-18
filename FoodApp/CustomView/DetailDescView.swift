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
        title1.text = Global.shareInstance().title
        desc.text = Global.shareInstance().category
        ingredient.text = "Ingredient"
        ingredientText.text = Global.shareInstance().ingredients
        detail_viewDesc.frame = self.bounds
        detail_viewDesc.layer.borderWidth = 0.5
        detail_viewDesc.layer.cornerRadius = 5.0
        detail_viewDesc.layer.masksToBounds = true
        detail_viewDesc.layer.borderColor = UIColor.gray.cgColor
    }

}
