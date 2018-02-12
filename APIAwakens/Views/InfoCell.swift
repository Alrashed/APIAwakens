//
//  InfoCell.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/6/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

typealias ButtonHandler = (InfoCell, UIButton) -> Void

class InfoCell:  UITableViewCell {
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var leftConversionButton: UIButton!
    @IBOutlet weak var rightConversionButton: UIButton!
    
    var conversionButtonHanlder: ButtonHandler?
    
    var length: String?
    var cost: String?
    var exchangeRate: Double?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if let length = length {
            valueLabel.text = length
            leftConversionButton.isHidden = false
            leftConversionButton.setTitle("English", for: .normal)
            rightConversionButton.isHidden = false
            rightConversionButton.setTitle("Metric", for: .normal)
        }

        if let cost = cost {
            valueLabel.text = cost
            leftConversionButton.isHidden = false
            leftConversionButton.setTitle("USD", for: .normal)
            rightConversionButton.isHidden = false
            rightConversionButton.setTitle("Credits", for: .normal)
            
            if let exchangeRate = exchangeRate, leftConversionButton.isSelected {
                valueLabel.text = convertCreditsToUSD(credits: cost, exchangeRate: exchangeRate)
            }
        }
    }
    
    @IBAction func leftConversionButtonTapped(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
            rightConversionButton.isSelected = false
            
            if sender.currentTitle == "English", let length = length {
                valueLabel.text = convertMetricToEnglish(metric: length)
            }
            else if sender.currentTitle == "USD", let cost = cost, let exchangeRate = exchangeRate {
                valueLabel.text = convertCreditsToUSD(credits: cost, exchangeRate: exchangeRate)
                conversionButtonHanlder?(self, sender)
            }
        }
    }
    
    @IBAction func rightConversionButtonTapped(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected = true
            leftConversionButton.isSelected = false
            
            if sender.currentTitle == "Metric", let length = length {
                valueLabel.text = length
            }
            else if sender.currentTitle == "Credits", let cost = cost {
                valueLabel.text = cost
                conversionButtonHanlder?(self, sender)
            }
        }
    }
    
    func convertMetricToEnglish(metric: String) -> String {
        if let metricValue = Double(metric) {
            let englishValue = metricValue / 0.3048
            
            return String(format: "%.2f", englishValue)
        }
        
        return metric
    }
    
    func convertCreditsToUSD(credits: String, exchangeRate: Double) -> String {
        if let credits = Double(credits) {
            let usd = (credits * exchangeRate)
            
            return String(format: "%.2f", usd)
        }
        
        return credits
    }
}

