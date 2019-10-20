//
//  CarsController.swift
//  CFTtest
//
//  Created by Miska  on 19/10/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation
import RealmSwift

class CarsController:NSObject{
    
    class func saveEditCars(Cars:CarsModel){
        let realm = try! Realm()
        try! realm.write {
            realm.add(Cars, update: .modified)
        }
    }
    
    class func fetchCars()->Results<CarsModel>{
        let realm = try! Realm()
        return realm.objects(CarsModel.self)
    }
    
    class func deleteCars(CarsToDelete: CarsModel){
        let realm = try! Realm()
        try! realm.write {
            realm.delete(CarsToDelete)
        }
    }

}
