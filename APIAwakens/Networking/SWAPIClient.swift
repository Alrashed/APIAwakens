//
//  SWAPIClient.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 2/17/18.
//  Copyright © 2018 Khalid Alrashed. All rights reserved.
//

import Foundation

class SWAPIClient: APIClient {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    
    // MARK: - Characters
    
    func fetchCharacters(completion: @escaping (Result<CharacterWrapper?, NetworkingError>) -> Void) {
        let characterRequest = EntityType.characters.request
        fetch(with: characterRequest, decode: { json in
            guard var characterWrapper = json as? CharacterWrapper else { return nil }
            self.fetchAllCharacters(from: characterWrapper, completion: { (result) in
                switch result {
                case .success(let wrapper):
                    characterWrapper = wrapper!
                    completion(.success(characterWrapper))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
            return characterWrapper
        }, completion: completion)
    }
    
    private func fetchMoreCharacters(_ wrapper: CharacterWrapper, completion: @escaping (Result<CharacterWrapper?, NetworkingError>) -> Void) {
        guard let nextURL = wrapper.next, let url = URL(string: nextURL) else { return }
        let request = URLRequest(url: url)
        fetch(with: request, decode: { json in
            guard let characterWrapper = json as? CharacterWrapper else { return nil }
            return characterWrapper
        }, completion: completion)
    }
    
    private func fetchAllCharacters(from wrapper: CharacterWrapper, completion: @escaping (Result<CharacterWrapper?, NetworkingError>) -> Void) {
        var characterWrapper = wrapper
        var characters: [Character] = characterWrapper.results
        
        if characters.count != characterWrapper.count, characterWrapper.next != nil {
            
            self.fetchMoreCharacters(characterWrapper, completion: { (result) in
                if case let .success(moreWrapper) = result {
                    
                    if let moreWrapper = moreWrapper {
                        characterWrapper.results.append(contentsOf: moreWrapper.results)
                        characterWrapper.next = moreWrapper.next
                        characters.append(contentsOf: moreWrapper.results)
                        
                        if characters.count == characterWrapper.count {
                            characterWrapper.results = characters
                            return completion(.success(characterWrapper))
                            
                        } else {
                            self.fetchAllCharacters(from: characterWrapper, completion: completion)
                        }
                    }
                }
            })
        }
    }
    

    // MARK: - Vehicles
    
    func fetchVehicles(completion: @escaping (Result<VehicleWrapper?, NetworkingError>) -> Void) {
        let vehicleRequest = EntityType.vehicles.request
        fetch(with: vehicleRequest, decode: { json in
            guard var vehicleWrapper = json as? VehicleWrapper else { return nil }
            self.fetchAllVehicles(from: vehicleWrapper, completion: { (result) in
                switch result {
                case .success(let wrapper):
                    vehicleWrapper = wrapper!
                    completion(.success(vehicleWrapper))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
            return vehicleWrapper
        }, completion: completion)
    }
    
    private func fetchMoreVehicles(_ wrapper: VehicleWrapper, completion: @escaping (Result<VehicleWrapper?, NetworkingError>) -> Void) {
        guard let nextURL = wrapper.next, let url = URL(string: nextURL) else { return }
        let request = URLRequest(url: url)
        fetch(with: request, decode: { json in
            guard let vehicleWrapper = json as? VehicleWrapper else { return nil }
            return vehicleWrapper
        }, completion: completion)
    }
    
    private func fetchAllVehicles(from wrapper: VehicleWrapper, completion: @escaping (Result<VehicleWrapper?, NetworkingError>) -> Void) {
        var vehicleWrapper = wrapper
        var vehicles: [Vehicle] = vehicleWrapper.results
        
        if vehicles.count != vehicleWrapper.count, vehicleWrapper.next != nil {
            
            self.fetchMoreVehicles(vehicleWrapper, completion: { (result) in
                if case let .success(moreWrapper) = result {
                    
                    if let moreWrapper = moreWrapper {
                        vehicleWrapper.results.append(contentsOf: moreWrapper.results)
                        vehicleWrapper.next = moreWrapper.next
                        vehicles.append(contentsOf: moreWrapper.results)
                        
                        if vehicles.count == vehicleWrapper.count {
                            vehicleWrapper.results = vehicles
                            return completion(.success(vehicleWrapper))
                            
                        } else {
                            self.fetchAllVehicles(from: vehicleWrapper, completion: completion)
                        }
                    }
                }
            })
        }
    }
    
    
    // MARK: - Starships
    
    func fetchStarships(completion: @escaping (Result<StarshipWrapper?, NetworkingError>) -> Void) {
        let vehicleRequest = EntityType.starships.request
        fetch(with: vehicleRequest, decode: { json in
            guard var starshipWrapper = json as? StarshipWrapper else { return nil }
            self.fetchAllStarships(from: starshipWrapper, completion: { (result) in
                switch result {
                case .success(let wrapper):
                    starshipWrapper = wrapper!
                    completion(.success(starshipWrapper))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
            return starshipWrapper
        }, completion: completion)
    }
    
    private func fetchMoreStarships(_ wrapper: StarshipWrapper, completion: @escaping (Result<StarshipWrapper?, NetworkingError>) -> Void) {
        guard let nextURL = wrapper.next, let url = URL(string: nextURL) else { return }
        let request = URLRequest(url: url)
        fetch(with: request, decode: { json in
            guard let starshipWrapper = json as? StarshipWrapper else { return nil }
            return starshipWrapper
        }, completion: completion)
    }
    
    private func fetchAllStarships(from wrapper: StarshipWrapper, completion: @escaping (Result<StarshipWrapper?, NetworkingError>) -> Void) {
        var starshipWrapper = wrapper
        var starships: [Starship] = starshipWrapper.results
        
        if starships.count != starshipWrapper.count, starshipWrapper.next != nil {
            
            self.fetchMoreStarships(starshipWrapper, completion: { (result) in
                if case let .success(moreWrapper) = result {
                    
                    if let moreWrapper = moreWrapper {
                        starshipWrapper.results.append(contentsOf: moreWrapper.results)
                        starshipWrapper.next = moreWrapper.next
                        starships.append(contentsOf: moreWrapper.results)
                        
                        if starships.count == starshipWrapper.count {
                            starshipWrapper.results = starships
                            return completion(.success(starshipWrapper))
                            
                        } else {
                            self.fetchAllStarships(from: starshipWrapper, completion: completion)
                        }
                    }
                }
            })
        }
    }
    
    // MARK: - Planets
    
    func fetchHomePlanet(for character: Character, completion: @escaping (Result<Planet?, NetworkingError>) -> Void) {
        let planetURL = character.home
        guard let url = URL(string: planetURL) else { return }
        let planetRequest = URLRequest(url: url)
        
        fetch(with: planetRequest, decode: { (json) in
            guard let planet = json as? Planet else { return nil }
            return planet
        }, completion: completion)
    }
}


