//
//  CategoryRealm.swift
//  Skillbox 12
//
//  Created by Артём on 6/16/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import Foundation
import RealmSwift

class CategoryRealm: Object {
    
    @objc dynamic var temp = 0.0
    @objc dynamic var wind = 0.0
    @objc dynamic var clouds = ""
    @objc dynamic var date = ""
    
}
