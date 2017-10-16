//
//  Starship.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/3/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

class Starship: Entity {
    
    var type: EntityType {
        return .Starships
    }
    
    let name: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let starshipClass: String
    let crew: String
    
    init(name: String, manufacturer: String, costInCredits: String, length: String, starshipClass: String, crew: String) {
        self.name = name
        self.manufacturer = manufacturer
        self.costInCredits = costInCredits
        self.length = length
        self.starshipClass = starshipClass
        self.crew = crew
    }
}

extension Starship {
    
    enum Keys: String, CustomStringConvertible {
        case name
        case manufacturer
        case cost_in_credits
        case length
        case starship_class
        case crew
        
        var description: String {
            switch self {
            case .name: return "Name"
            case .manufacturer: return "Make"
            case .cost_in_credits: return "Cost"
            case .length: return "Length"
            case .starship_class: return "Class"
            case .crew: return "Crew"
            }
        }
    }
    
    convenience init?(json: [String: Any]) {
        guard let name = json[Keys.name.rawValue] as? String,
            let manufacturer = json[Keys.manufacturer.rawValue] as? String,
            let cost_in_credits = json[Keys.cost_in_credits.rawValue] as? String,
            let length = json[Keys.length.rawValue] as? String,
            let starship_class = json[Keys.starship_class.rawValue] as? String,
            let crew = json[Keys.crew.rawValue] as? String else {
                return nil
        }
        
        self.init(name: name, manufacturer: manufacturer, costInCredits: cost_in_credits, length: length, starshipClass: starship_class, crew: crew)
    }
}
