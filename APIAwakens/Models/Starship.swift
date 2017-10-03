//
//  Starship.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/3/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

class Starship {
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
