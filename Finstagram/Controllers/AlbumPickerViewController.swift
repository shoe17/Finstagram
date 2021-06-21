//
//  AlbumPickerViewController.swift
//  Finstagram
//
//  Created by Darian Low on 6/20/21.
//

import UIKit

protocol PickerViewControllerDelegate: class {
    func selectedRow(row: Int)
}

class AlbumPickerViewController: UIViewController, PickerViewControllerDelegate {
    
    @IBOutlet var albumPicker: UIPickerView!
    
    
    var albumPickerDataSource: AlbumPickerDataSource?
    var albumPickerDelegate: AlbumPickerDelegate?
    
    let data: [String] = ["Grocery", "Todo", "Maintenance", "Outside", "Other"]

    override func viewDidLoad() {
        super.viewDidLoad()
        albumPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        albumPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        albumPicker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.albumPickerDelegate = AlbumPickerDelegate(withDelegate: self)
        self.albumPickerDataSource = AlbumPickerDataSource(withData: data)
        // Do any additional setup after loading the view.
        self.albumPicker.delegate = self.albumPickerDelegate
        self.albumPicker.dataSource = self.albumPickerDataSource
        
    }
    
    func selectedRow(row: Int) {
        print("Row: \(row)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
