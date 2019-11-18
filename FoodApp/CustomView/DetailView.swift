//
//  DetailView.swift
//  FoodApp
//
//  Created by Ashraf on 10/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import UIKit

class DetailView: UIView {
    @IBOutlet var detail_view: UIView!
    @IBOutlet weak var image_view: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("DetailView", owner: self, options: nil)
        addSubview(detail_view)
        detail_view.frame = self.bounds
        detail_view.layer.borderWidth = 1.0
        detail_view.layer.cornerRadius = 5.0
        detail_view.layer.masksToBounds = true
        detail_view.layer.borderColor = UIColor.clear.cgColor
    }

}
