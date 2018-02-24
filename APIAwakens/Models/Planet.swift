//
//  Planet.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 2/24/18.
//  Copyright © 2018 Khalid Alrashed. All rights reserved.
//

import Foundation

struct Planet: Entity {
    
    var type: EntityType {
        return .planets
    }
    
    let name: String
}
