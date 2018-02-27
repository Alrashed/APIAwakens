//
//  Entity.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/14/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

enum EntityType: String, Decodable {
    case characters
    case vehicles
    case starships
    case planets
}

protocol Entity: Decodable {
    var name: String { get }
    var size: Double? { get }
    var type: EntityType { get }
}
