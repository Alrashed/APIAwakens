//
//  ConversionCell.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/16/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if parentResponder is UIViewController {
                return parentResponder as! UIViewController!
            }
        }
        return nil
    }
}

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
    
    func showTextFieldError() {
        let alert = UIAlertController(title: "Invalid Exchange Rate", message: "Please enter an exchange rate value bigger than 0", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        self.parentViewController?.present(alert, animated: true, completion: nil)
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
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let text = textField.text, Double(text)! <= 0 {
            showTextFieldError()
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setExchangeRate()
    }
}
