//
//  Vehicle.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/3/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

struct Vehicle: Entity {
    
    var type: EntityType {
        return .vehicles
    }
    
    let name: String
    let make: String
    let cost: String
    let length: String
    let `class`: String
    let crew: String
    
    enum CodkingKeys: String, CodingKey {
        case name
        case make = "manufacturer"
        case cost = "cost_in_credits"
        case length
        case `class` = "vehicle_class"
        case crew
    }
}
