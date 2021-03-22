//
//  ViewController5daysAlamo.swift
//  Skillbox 12
//
//  Created by Артём on 5/12/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit

class ViewController5daysAlamo: UIViewController {

    @IBOutlet weak var tableViewAlamo: UITableView!
    
    var categories: [Category] = []
    var categoriesRealm: [CategoryRealm] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            let loader = WeatherLoaderAlamo()
            loader.delegate = self
            loader.loadWeatherAlamo()
            reloadData()
        }
    
    private func reloadData(){
        let categoriesRealm = RealmWork.shared.getData()
        for category in categoriesRealm{
            categories.append(Category(temp: category.temp, wind: category.wind, clouds: category.clouds, date: category.date)!)
        }
    }
    
    }



    extension ViewController5daysAlamo: WeatherLoaderAlamoDelegate{
        func loaded(categories: [Category]) {
            self.categories = categories
            tableViewAlamo.reloadData()
        }
    }


    extension ViewController5daysAlamo: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return categories.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellAlamo") as! CategoryCellAlamo
            
            let model = categories[indexPath.row]
            
    //        cell.backgroundColor = UIColor.systemGray
            
            cell.alamo5TempLabel.text = "\(Int(model.temp))ºC"
            cell.alamo5CloudsLabel.text = model.clouds
            cell.alamo5WindLabel.text =  "\(Int(model.wind))m/s"
            cell.Alamo5DateLabel.text = model.date
            return cell
            
        }
}
