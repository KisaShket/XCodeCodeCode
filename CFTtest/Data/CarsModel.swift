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
    @objc dynamic var manufacturer: String = ""
    @objc dynamic var model: String = ""
    @objc dynamic var horsePower: String = ""
    @objc dynamic var engineType: String = ""
    @objc dynamic var bodyType: String = ""
    @objc dynamic var issueDate: String = ""
    @objc dynamic var bodyTypeRow: Int = 0
    @objc dynamic var engineTypeRow: Int = 0
    @objc dynamic var id = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

