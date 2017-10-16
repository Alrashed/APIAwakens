//
//  Character.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/3/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

class Character: Entity {
    
    var type: EntityType {
        return .character
    }
    
    let name: String
    let birthYear: String
    let homeworld: String
    let height: String
    let eyeColor: String
    let hairColor: String
    
    init(name: String, birthYear: String, homeworld: String, height: String, eyeColor: String, hairColor: String) {
        self.name = name
        self.birthYear = birthYear
        self.homeworld = homeworld
        self.height = height
        self.eyeColor = eyeColor
        self.hairColor = hairColor
    }
}

extension Character {
    
    enum Keys: String, CustomStringConvertible {
        case name
        case birth_year
        case homeworld
        case height
        case eye_color
        case hair_color
        
        var description: String {
            switch self {
            case .name: return "Name"
            case .birth_year: return "Born"
            case .homeworld: return "Home"
            case .height: return "Height"
            case .eye_color: return "Eyes"
            case .hair_color: return "Hair"
            }
        }
    }
    
    convenience init?(json: [String: Any]) {
        guard let name = json[Keys.name.rawValue] as? String,
            let birth_year = json[Keys.birth_year.rawValue] as? String,
            let homeworld = json[Keys.homeworld.rawValue] as? String,
            let height = json[Keys.height.rawValue] as? String,
            let eye_color = json[Keys.eye_color.rawValue] as? String,
            let hair_color = json[Keys.hair_color.rawValue] as? String else {
                return nil
        }
        
        self.init(name: name, birthYear: birth_year, homeworld: homeworld, height: height, eyeColor: eye_color, hairColor: hair_color)
    }
}
