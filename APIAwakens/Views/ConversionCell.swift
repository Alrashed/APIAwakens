//
//  ConversionCell.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 10/16/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

class ConversionCell: UITableViewCell {
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.delegate = self
        textField.keyboardType = .decimalPad
        textField.addDoneCancelToolbar()
    }
    
    static var identifier: String {
        return String(describing: self)
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
}
