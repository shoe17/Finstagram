//
//  AlbumPickerDelegate.swift
//  Finstagram
//
//  Created by Darian Low on 6/20/21.
//

import UIKit

class AlbumPickerDelegate: NSObject, UIPickerViewDelegate {
    var delegate: PickerViewControllerDelegate?
    
    init(withDelegate delegate: PickerViewControllerDelegate) {
        self.delegate = delegate
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.delegate?.selectedRow(row: row)
    }
    
    
}
