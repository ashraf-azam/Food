//
//  FoodTableVC.swift
//  FoodApp
//
//  Created by Ashraf on 09/11/2019.
//  Copyright © 2019 Ashraf. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FoodTableVC: UITableViewController {
    
    @IBOutlet var myTable: UITableView!
    let foods = Bundle.main.decode([Food].self, from: "recipe.json")
    let disposeBag = DisposeBag()
    let sharedData = global.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTable.dataSource = nil
        self.showTableModel()
    }
    
    func showTableModel() {
        let objFood : Observable<[Food]> = Observable.just(foods)
        objFood.bind(to: myTable.rx.items(cellIdentifier: "FoodCell")) {
            _, food, cell in
            if let cellToUse = cell as? FoodTableCell {
                cellToUse.food_title.text = food.name
                cellToUse.img_view.image = UIImage(named: food.imageName)
            }
            }
    }
    
    func selectedModel() {
        myTable.rx.modelSelected(Food.self).subscribe(onNext: {
            food in
            self.sharedData.ingredients = food.ingredients
            self.sharedData.imageFood = UIImage(named:food.imageName)!
            self.detailVC()
        })
    }
    
    func detailVC() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}
