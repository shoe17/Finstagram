//
//  AlbumPickerDataSource.swift
//  Finstagram
//
//  Created by Darian Low on 6/20/21.
//

import UIKit

class AlbumPickerDataSource: NSObject, UIPickerViewDataSource {
    var data = [String]()
    
    init(withData data: [String]) {
        self.data = data
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
