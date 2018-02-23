//
//  Endpoint.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 2/17/18.
//  Copyright © 2018 Khalid Alrashed. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var compenents = URLComponents(string: base)!
        compenents.path = path
        return compenents
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

extension EntityType: Endpoint {
    var base: String {
        return "https://swapi.co"
    }
    
    var path: String {
        switch self {
        case .characters: return "/api/people/"
        case .vehicles: return "/api/vehicles/"
        case .starships: return "/api/starships/"
        }
    }
}
