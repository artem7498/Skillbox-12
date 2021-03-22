//
//  RealmWork.swift
//  Skillbox 12
//
//  Created by Артём on 6/10/20.
//  Copyright © 2020 Artem A. All rights reserved.
//

import UIKit
import RealmSwift

class RealmWork {
    
    static let shared = RealmWork()
    
    private let realm = try! Realm()
    
    func getData() -> [CategoryRealm]{
        var categoriesRealm: [CategoryRealm] = []
        let objects = realm.objects(CategoryRealm.self)
        for object in objects{
            categoriesRealm += [object]
        }
        return categoriesRealm
    }
    
    func save(arrayOfObjects: [Object]) {
        try! realm.write{
            realm.add(arrayOfObjects)
        }
    }
    
    func delete() {
        try! realm.write{
            realm.deleteAll()
        }
    }
}
