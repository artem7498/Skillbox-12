//
//  WeatherLoaderAlamo.swift
//  Skillbox 12
//
//  Created by Артём on 5/12/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import Alamofire


protocol WeatherLoaderAlamoDelegate {
    func loaded(categories: [Category])
}

class WeatherLoaderAlamo{
    
var delegate: WeatherLoaderAlamoDelegate?
    
    
    func loadWeatherAlamo(){

        AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Moscow,ru&units=metric&appid=3bfb2a249e3e057e511ffa991432964b").responseJSON{
            (response) in
            if let data = response.data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary,
                let jsonDict = json["list"] as? NSArray{

                var categories: [Category] = []

                for dict in jsonDict{
                    if let category = Category(data: dict as! NSDictionary)
                    {categories.append(category)}
                    print(categories.count)
                }
                
                RealmWork.shared.delete()
                
                var categoriesRealm: [CategoryRealm] = []
                
                for category in categories {
                    let categoryRealm = CategoryRealm()
                    categoryRealm.temp = category.temp
                    categoryRealm.wind = category.wind
                    categoryRealm.clouds = category.clouds
                    categoryRealm.date = category.date
                    categoriesRealm.append(categoryRealm)
                }
                RealmWork.shared.save(arrayOfObjects: categoriesRealm)
                print(categoriesRealm)
                
                DispatchQueue.main.async {
                    print(jsonDict)
                self.delegate?.loaded(categories: categories)
                }
            }
        }
    }
}
