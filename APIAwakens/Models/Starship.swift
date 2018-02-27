//
//  Starship.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/3/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

struct Starship: Entity {
    
    var type: EntityType {
        return .starships
    }
    
    let name: String
    let make: String
    let cost: String
    let length: String
    let `class`: String
    let crew: String
    
    var size: Double? {
        return Double(length)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case make = "manufacturer"
        case cost = "cost_in_credits"
        case length
        case `class` = "starship_class"
        case crew
    }
}

struct StarshipWrapper: Decodable {
    var results: [Starship]
    var count: Int
    var next: String?
    var previous: String?
}
