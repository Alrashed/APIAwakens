//
//  Vehicle.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/3/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

class Vehicle: Entity {
    
    var type: EntityType {
        return .Vehicles
    }
    
    let name: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let vehicleClass: String
    let crew: String
    
    init(name: String, manufacturer: String, costInCredits: String, length: String, vehicleClass: String, crew: String) {
        self.name = name
        self.manufacturer = manufacturer
        self.costInCredits = costInCredits
        self.length = length
        self.vehicleClass = vehicleClass
        self.crew = crew
    }
}

extension Vehicle {
    
    enum Keys: String, CustomStringConvertible {
        case name
        case manufacturer
        case cost_in_credits
        case length
        case vehicle_class
        case crew
        
        var description: String {
            switch self {
            case .name: return "Name"
            case .manufacturer: return "Make"
            case .cost_in_credits: return "Cost"
            case .length: return "Length"
            case .vehicle_class: return "Class"
            case .crew: return "Crew"
            }
        }
    }
    
    convenience init?(json: [String: Any]) {
        guard let name = json[Keys.name.rawValue] as? String,
            let manufacturer = json[Keys.manufacturer.rawValue] as? String,
            let cost_in_credits = json[Keys.cost_in_credits.rawValue] as? String,
            let length = json[Keys.length.rawValue] as? String,
            let vehicle_class = json[Keys.vehicle_class.rawValue] as? String,
            let crew = json[Keys.crew.rawValue] as? String else {
                return nil
        }
        
        self.init(name: name, manufacturer: manufacturer, costInCredits: cost_in_credits, length: length, vehicleClass: vehicle_class, crew: crew)
    }
}
