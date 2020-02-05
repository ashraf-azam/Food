//
//  DetailVC.swift
//  FoodApp
//
//  Created by Ashraf on 10/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var selectedFood = [Food]()
    let dataVM = FoodTableViewModel()

    @IBOutlet weak var detail_view: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        detail_view.image_view.image = dataVM.getImage()
    }

}
