//
//  People.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/3/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

class People {
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
