//
//  NetworkingError.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 2/23/18.
//  Copyright © 2018 Khalid Alrashed. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }
    }
}
