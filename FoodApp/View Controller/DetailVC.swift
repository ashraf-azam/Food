//
//  DetailVC.swift
//  FoodApp
//
//  Created by Ashraf on 10/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DetailVC: UIViewController {

    @IBOutlet weak var detail_view: DetailView!
    @IBOutlet weak var detailDesc: DetailDescView!
    
    var setTitle: String = ""
    var setIngredients: String = ""
    var setImage: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        detail_view.image_view.image = setImage
        detailDesc.title1.text = setTitle
        detailDesc.ingredientText.text = setIngredients
    }

}
