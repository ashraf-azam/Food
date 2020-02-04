//
//  DetailVC.swift
//  FoodApp
//
//  Created by Ashraf on 10/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var detail_view: DetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sharedData = global.sharedInstance
        view.backgroundColor = UIColor.darkGray
        detail_view.image_view.image = sharedData.imageFood
    }

}
