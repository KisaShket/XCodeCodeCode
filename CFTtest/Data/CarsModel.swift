//
//  CarsModel.swift
//  CFTtest
//
//  Created by Miska  on 19/10/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import Foundation
import RealmSwift
class CarsModel: Object {
    @objc dynamic var carName: String = ""
    @objc dynamic var model: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var id = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

