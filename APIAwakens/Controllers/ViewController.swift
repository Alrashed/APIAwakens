//
//  ViewController.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/2/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct SegueIdentifiers {
        static let showCharacters = "showCharacters"
        static let showVehicles = "showVehicles"
        static let showStarships = "showStarships"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        
        if segue.identifier == SegueIdentifiers.showCharacters {
            detailViewController.pickedEntityType = .characters
            
        } else if segue.identifier == SegueIdentifiers.showVehicles {
            detailViewController.pickedEntityType = .vehicles
            
        } else if segue.identifier == SegueIdentifiers.showStarships {
            detailViewController.pickedEntityType = .starships
        }
    }
}
