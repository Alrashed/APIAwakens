//
//  Character.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/3/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

struct Character: Entity {
    
    var type: EntityType {
        return .characters
    }
    
    let name: String
    let born: String
    let home: String
    let height: String
    let eyes: String
    let hair: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case born = "birth_year"
        case home = "homeworld"
        case height
        case eyes = "eye_color"
        case hair = "hair_color"
    }
}
