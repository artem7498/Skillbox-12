//
//  Category.swift
//  Skillbox 12
//
//  Created by Артём on 5/7/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation

class Category {
    
    var temp: Double
    var wind: Double
    var clouds: String
    var date: String
    
    init?(data: NSDictionary){
        guard let containerTemp = data["main"] as? NSDictionary,
            let temp = containerTemp["temp"] as? Double,
            let containerClouds = data["weather"] as? [NSDictionary],
            let clouds = containerClouds[0]["description"] as? String,
            let containerWind = data["wind"] as? NSDictionary,
            let wind = containerWind["speed"] as? Double,
            let date = data["dt_txt"] as? String else{
                return nil
            }
        self.temp = temp
        self.clouds = clouds
        self.wind = wind
        self.date = date
    }
    
    init?(temp: Double, wind: Double, clouds: String, date: String) {
        self.temp = temp
        self.wind = wind
        self.clouds = clouds
        self.date = date
    }
    
}

