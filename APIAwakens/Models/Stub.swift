//
//  Stub.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/11/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

struct Stub {
    static var characters: [Character] {
        let lukeSkywalker = Character(name: "Luke Skywalker", born: "19BBY", home: "Tatooine", height: "172", eyes: "Blue", hair: "Blond")
        let darthVader = Character(name: "Darth Vadaer", born: "41.9BBY", home: "Tatooine", height: "202", eyes: "Yellow", hair: "none")
        
        return [lukeSkywalker, darthVader]
    }
    
    static var starships: [Starship] {
        let executor = Starship(name: "Executor", make: "Fondor Shipyards", cost: "1143350000", length: "1900", class: "Star Dreadnought", crew: "279144")
        let deathStar = Starship(name: "Death Star", make: "Sienar Fleet Systems", cost: "1000000000000", length: "120000", class: "Deep Space Mobile Battlestation", crew: "342953")
        
        return [executor, deathStar]
    }
    
    static var vehicles: [Vehicle] {
        let sandCrawler = Vehicle(name: "Sand Crawler", make: "Corellia Mining Corporation", cost: "150000", length: "36.8", class: "Wheeled", crew: "46")
        let snowspeeder = Vehicle(name: "Snowspeeder", make: "Incom Corporation", cost: "unknown", length: "4.5", class: "Airspeeder", crew: "2")
        
        return [sandCrawler, snowspeeder]
    }
}
