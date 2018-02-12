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
        let lukeSkywalker = Character(name: "Luke Skywalker", birthYear: "19BBY", homeworld: "Tatooine", height: "172", eyeColor: "Blue", hairColor: "Blond")
        let darthVader = Character(name: "Darth Vadaer", birthYear: "41.9BBY", homeworld: "Tatooine", height: "202", eyeColor: "Yellow", hairColor: "none")
        
        return [lukeSkywalker, darthVader]
    }
    
    static var starships: [Starship] {
        let executor = Starship(name: "Executor", manufacturer: "Fondor Shipyards", costInCredits: "1143350000", length: "1900", starshipClass: "Star Dreadnought", crew: "279144")
        let deathStar = Starship(name: "Death Star", manufacturer: "Sienar Fleet Systems", costInCredits: "1000000000000", length: "120000", starshipClass: "Deep Space Mobile Battlestation", crew: "342953")
        
        return [executor, deathStar]
    }
    
    static var vehicles: [Vehicle] {
        let sandCrawler = Vehicle(name: "Sand Crawler", manufacturer: "Corellia Mining Corporation", costInCredits: "150000", length: "36.8", vehicleClass: "Wheeled", crew: "46")
        let snowspeeder = Vehicle(name: "Snowspeeder", manufacturer: "Incom Corporation", costInCredits: "unknown", length: "4.5", vehicleClass: "Airspeeder", crew: "2")
        
        return [sandCrawler, snowspeeder]
    }
}
