//
//  DetailViewController.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/6/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedPickerRow: Int = 0
    var entityItems: [Entity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        if let entityItems = entityItems {
            nameLabel.text = entityItems[selectedPickerRow].name
            self.title = entityItems[selectedPickerRow].type.rawValue
        }
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let entityItemsCount = entityItems?[section].rowCount else { fatalError() }
        return entityItemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier, for: indexPath) as? InfoCell, let entityItems = entityItems else { fatalError() }
        
        let item = entityItems[selectedPickerRow]
        
        switch item.type {
        case .Characters:
            if let item = item as? Character {
                switch indexPath.row {
                case 0:
                    cell.keyLabel.text = Character.Keys.birth_year.description
                    cell.valueLabel.text = item.birthYear
                case 1:
                    cell.keyLabel.text = Character.Keys.homeworld.description
                    cell.valueLabel.text = item.homeworld
                case 2:
                    cell.keyLabel.text = Character.Keys.height.description
                    cell.valueLabel.text = item.height
                case 3:
                    cell.keyLabel.text = Character.Keys.eye_color.description
                    cell.valueLabel.text = item.eyeColor
                case 4:
                    cell.keyLabel.text = Character.Keys.hair_color.description
                    cell.valueLabel.text = item.hairColor
                default: break
                }
            }
            
        case .Vehicles:
            if let item = item as? Vehicle {
                switch indexPath.row {
                case 0:
                    cell.keyLabel.text = Vehicle.Keys.manufacturer.description
                    cell.valueLabel.text = item.manufacturer
                case 1:
                    cell.keyLabel.text = Vehicle.Keys.cost_in_credits.description
                    cell.valueLabel.text = item.costInCredits
                case 2:
                    cell.keyLabel.text = Vehicle.Keys.length.description
                    cell.valueLabel.text = item.length
                case 3:
                    cell.keyLabel.text = Vehicle.Keys.vehicle_class.description
                    cell.valueLabel.text = item.vehicleClass
                case 4:
                    cell.keyLabel.text = Vehicle.Keys.crew.description
                    cell.valueLabel.text = item.crew
                default: break
                }
            }
            
        case .Starships:
            if let item = item as? Starship {
                switch indexPath.row {
                case 0:
                    cell.keyLabel.text = Starship.Keys.manufacturer.description
                    cell.valueLabel.text = item.manufacturer
                case 1:
                    cell.keyLabel.text = Starship.Keys.cost_in_credits.description
                    cell.valueLabel.text = item.costInCredits
                case 2:
                    cell.keyLabel.text = Starship.Keys.length.description
                    cell.valueLabel.text = item.length
                case 3:
                    cell.keyLabel.text = Starship.Keys.starship_class.description
                    cell.valueLabel.text = item.starshipClass
                case 4:
                    cell.keyLabel.text = Starship.Keys.crew.description
                    cell.valueLabel.text = item.crew
                default: break
                }
            }
        }
        
        return cell
    }
    
    // MARK: - Picker View Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let entityItems = entityItems else { fatalError() }
        return entityItems.count
    }
    
    // MARK: - Picker View Delegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let entityItems = entityItems else { fatalError() }
        
        return entityItems[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerRow = row
        nameLabel.text = entityItems![selectedPickerRow].name
        
        tableView.reloadData()
    }
}
