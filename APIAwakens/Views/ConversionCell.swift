//
//  ConversionCell.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/16/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

protocol ExchangeRateDelegate: class {
    var exchangeRate: Double { get set }
}

class ConversionCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: ExchangeRateDelegate?
    var previousValue: Double = 1.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.delegate = self
        textField.keyboardType = .decimalPad
        textField.addDoneCancelToolbar()
                
        setExchangeRate()
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func setExchangeRate() {
        if let exchangeRateString = textField.text, let exchangeRate = Double(exchangeRateString) {
            delegate?.exchangeRate = exchangeRate
        } else {
            textField.text = "\(previousValue)"
        }
    }
}

// MARK: - Text Field Delegate

extension ConversionCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        textField.toolBarDoneButton(isEnabled: (newText.length > 0))
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        previousValue = Double(textField.text!)!
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setExchangeRate()
    }
}


