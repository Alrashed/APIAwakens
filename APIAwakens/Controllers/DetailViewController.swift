//
//  DetailViewController.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/6/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, ExchangeRateDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let client = SWAPIClient()
    var pickedEntityType: EntityType!
    var entities: [Entity]? {
        didSet {
            tableView.reloadData()
            pickerView.reloadAllComponents()
            nameLabel.text = entities![selectedPickerRow].name
        }
    }
    
    var isConversionCellHidden = true
    var selectedPickerRow: Int = 0
    var exchangeRate: Double = 1.0 {
        didSet {
            tableView.reloadData()
            hideConverionCell()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView()
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.title = pickedEntityType.rawValue.capitalized
        
        fetchEntities()
    }
    
    func fetchEntities() {
        switch pickedEntityType {
        case .characters:
            client.fetchCharacters(completion: { (result) in
                switch result {
                case .success(let wrapper):
                    if let wrapper = wrapper, wrapper.results.count == wrapper.count {
                        self.entities = wrapper.results
                    }
                case .failure(let error):
                    print(error)
                }
            })
            
        case .vehicles:
            client.fetchVehicles(completion: { (result) in
                switch result {
                case .success(let wrapper):
                    if let wrapper = wrapper, wrapper.results.count == wrapper.count {
                        self.entities = wrapper.results
                    }
                case .failure(let error):
                    print(error)
                }
            })
            
        case .starships:
            client.fetchStarships(completion: { (result) in
                switch result {
                case .success(let wrapper):
                    if let wrapper = wrapper, wrapper.results.count == wrapper.count {
                        self.entities = wrapper.results
                    }
                case .failure(let error):
                    print(error)
                }
            })
            
        default: break
        }
    }

    
    func showConversionCell() {
        if isConversionCellHidden {
            isConversionCellHidden = false
        }
        
        guard let conversionCell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? ConversionCell else { fatalError() }
        conversionCell.textField.becomeFirstResponder()
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func hideConverionCell() {
        isConversionCellHidden = true
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func conversionButtonTapHandler() -> ButtonHandler {
        return { [unowned self] cell, button in
            if self.isConversionCellHidden {
                if button == cell.leftConversionButton {
                    self.showConversionCell()
                }
            } else {
                if button == cell.rightConversionButton {
                    self.view.endEditing(true)
                    self.hideConverionCell()
                }
            }
        }
    }
}

// MARK: - Table View Data Source

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier) as? InfoCell, let entities = entities else {
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor(red: 27/255, green: 32/255, blue: 36/255, alpha: 1)
            return cell
            
        }
        
        let entity = entities[selectedPickerRow]
        
        switch pickedEntityType {
            
        case .characters:
            if let entity = entity as? Character {
                switch indexPath.row {
                case 0:
                    cell.keyLabel.text = "Born"
                    cell.valueLabel.text = entity.born
                case 1:
                    cell.keyLabel.text = "Home"
                    cell.valueLabel.text = ""
                    client.fetchHomePlanet(for: entity, completion: { (result) in
                        if case let .success(planet) = result {
                            cell.valueLabel.text = planet!.name.capitalized
                        } else {
                            cell.valueLabel.text = "unknown"
                        }
                    })
                case 2:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionCell.identifier) as? ConversionCell else { return UITableViewCell() }
                    cell.delegate = self
                    return cell
                case 3:
                    cell.keyLabel.text = "Height"
                    cell.length = entity.height
                case 4:
                    cell.keyLabel.text = "Eyes"
                    cell.valueLabel.text = entity.eyes.capitalized
                case 5:
                    cell.keyLabel.text = "Hair"
                    cell.valueLabel.text = entity.hair.capitalized
                default: break
                }
            }
            
        case .vehicles:
            if let entity = entity as? Vehicle {
                switch indexPath.row {
                case 0:
                    cell.keyLabel.text = "Make"
                    cell.valueLabel.text = entity.make
                case 1:
                    cell.keyLabel.text = "Cost"
                    cell.cost = entity.cost
                    cell.exchangeRate = exchangeRate
                    cell.conversionButtonHanlder = conversionButtonTapHandler()
                case 2:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionCell.identifier) as? ConversionCell else { return UITableViewCell() }
                    cell.delegate = self
                    return cell
                case 3:
                    cell.keyLabel.text = "Length"
                    cell.length = entity.length
                case 4:
                    cell.keyLabel.text = "Class"
                    cell.valueLabel.text = entity.class
                case 5:
                    cell.keyLabel.text = "Crew"
                    cell.valueLabel.text = entity.crew
                default: break
                }
            }
            
        case .starships:
            if let entity = entity as? Starship {
                switch indexPath.row {
                case 0:
                    cell.keyLabel.text = "Make"
                    cell.valueLabel.text = entity.make
                case 1:
                    cell.keyLabel.text = "Cost"
                    cell.cost = entity.cost
                    cell.exchangeRate = exchangeRate
                    cell.conversionButtonHanlder = conversionButtonTapHandler()
                case 2:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: ConversionCell.identifier) as? ConversionCell else { return UITableViewCell() }
                    cell.delegate = self
                    return cell
                case 3:
                    cell.keyLabel.text = "Length"
                    cell.length = entity.length
                case 4:
                    cell.keyLabel.text = "Class"
                    cell.valueLabel.text = entity.class
                case 5:
                    cell.keyLabel.text = "Crew"
                    cell.valueLabel.text = entity.crew
                default: break
                }
            }
            
        default: break
        }
        return cell
    }
}

// MARK: - Table View Delegate

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var rowHeight: CGFloat = 38.0
        
        if indexPath.row == 2 && isConversionCellHidden {
            rowHeight = 0.0
        }
        
        return rowHeight
    }
}

// MARK: - Picker View Data Source

extension DetailViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let entities = entities else { return 0 }
        return entities.count
    }
}

// MARK: - Picker View Delegate

extension DetailViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let entities = entities else { return nil }
        return entities[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerRow = row
        nameLabel.text = entities![selectedPickerRow].name
        tableView.reloadData()
    }
}
