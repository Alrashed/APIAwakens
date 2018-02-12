//
//  UITextField+AddDoneCancelToolBar.swift
//  APIAwakens
//
//  Created by Khalid Alrashed on 2/12/18.
//  Copyright © 2018 Khalid Alrashed. All rights reserved.
//

import UIKit

extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
    
    func toolBarDoneButton(isEnabled: Bool) {
        if let toolbar = self.inputAccessoryView as? UIToolbar, let doneButton = toolbar.items?[2], doneButton.title == "Done" {
            doneButton.isEnabled = isEnabled
        }
    }
}
