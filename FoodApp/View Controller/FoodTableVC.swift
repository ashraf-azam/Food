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
    
    let test = PublishSubject<String>()
    private let selectedVariable = Variable("")
    var selectedObserver:Observable<String>{
        return selectedVariable.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        self.selectedModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTable.dataSource = nil
        self.showTableModel()
    }
    
    func showTableModel() {
        let objFood : Observable<[Food]> = Observable.just(foods)
//        let objFood : Observable<[Food]> = Observable.from(optional: foods)
        objFood.bind(to: myTable.rx.items(cellIdentifier: "FoodCell")) {
            _, food, cell in
            if let cellToUse = cell as? FoodTableCell {
                cellToUse.food_title.text = food.name
                cellToUse.img_view.image = UIImage(named: food.imageName)
            }
        }.disposed(by: disposeBag)
    }
    
    func selectedModel() {
        myTable.rx.modelSelected(Food.self).subscribe(onNext: {
            food in
            self.detailVC(foodName: food.name, ingredients: food.ingredients, image: UIImage(named:food.imageName)!)
            }).disposed(by: disposeBag)
    }
    
    func detailVC(foodName: String, ingredients: String, image: UIImage) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        vc.setTitle = foodName
        vc.setIngredients = ingredients
        vc.setImage = image
        selectedVariable.value = foodName
        let currentLanguage = BehaviorSubject(value: foodName)
        currentLanguage
            .bind(to: vc.navigationItem.rx.title)
            .disposed(by: disposeBag)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
