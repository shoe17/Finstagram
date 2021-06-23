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

class AlbumPickerViewController: UIViewController, PickerViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet var albumPicker: UIPickerView!
    
    
    var albumPickerDataSource: AlbumPickerDataSource!
    var albumPickerDelegate: AlbumPickerDelegate!
    var image: UIImage?
    var alubmName: String?
    
    let activityIndicator = UIActivityIndicatorView(style: .gray)

    @IBOutlet var doneButton: UIBarButtonItem!
    
    let data: [String] = ["Grocery", "Todo", "Maintenance", "Outside", "Other"]
    
    convenience init() {
        self.init(image: nil)
    }
    
    init(image: UIImage?) {
        self.image = image
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumPicker.translatesAutoresizingMaskIntoConstraints = false
        albumPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        albumPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        albumPicker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        //self.albumPickerDelegate = AlbumPickerDelegate(withDelegate: self)
        //self.albumPickerDataSource = AlbumPickerDataSource(withData: ["Grocery", "Todo", "Maintenance", "Outside", "Other"])
        // Do any additional setup after loading the view.
        //self.albumPicker.delegate = self.albumPickerDelegate
        //self.albumPicker.dataSource = self.albumPickerDataSource
        albumPicker.delegate = self
        albumPicker.dataSource = self
        
    }
    
    
    func selectedRow(row: Int) {
        
        print("Row: \(albumPickerDataSource.data[row])")
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        alubmName = data[row]
    }
    
    @IBAction func doneButonPressed(_ sender: UIBarButtonItem) {
        if let albumName = alubmName, let image = image {
            saveToAlbum(named: albumName, image: image)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func presentAlert(title: String, message: String) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        
    }
    
    func saveToAlbum(named: String, image: UIImage) {
        let album = CustomAlbum(name: named)
        album.save(image: image) { (result) in
            switch result {
            case .success(_):
                //self.presentAlert(title: "Success", message: "Successfully save photo to album \"\(named)\"")
                return
            case .failure(let err):
                //self.presentAlert(title: "Error", message: err.localizedDescription)
                return
            }
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError err: Error?, contextInfo: UnsafeRawPointer) {
        activityIndicator.stopAnimating()
        if let err = err {
            // we got back an error!
            presentAlert(title: "Error", message: err.localizedDescription)
        } else {
            presentAlert(title: "Saved!", message: "Image saved successfully")
        }
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
