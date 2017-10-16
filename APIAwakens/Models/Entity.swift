//
//  Entity.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/14/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

enum EntityType {
    case character
    case vehicle
    case starship
}

protocol Entity {
    var name: String { get }
    var rowCount: Int { get }
    var type: EntityType { get }
}

extension Entity {
    var rowCount: Int {
        return 5
    }
}
