//
//  NewPostViewController.swift
//  Finstagram
//
//  Created by Darian Low on 1/14/21.
//

import UIKit
import PhotosUI

class NewPostViewController: UIViewController{
    
    @IBOutlet var newPostTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newPostTableView.delegate = self
        newPostTableView.dataSource = self
        newPostTableView.rowHeight = 50
        newPostTableView.register(UINib(nibName: "ThumbnailAndCaptionCell", bundle: nil), forCellReuseIdentifier: "ThumbnailAndCaptionCell")
        
    }
    
}

//MARK: - UITableViewDataSource and UITableViewDelegate

extension NewPostViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThumbnailAndCaptionCell", for: indexPath) as! ThumbnailAndCaptionCell
        cell.thumbnailAndCaptionCellDelegate = self
        cell.thumbnail.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

//MARK: - PHPickerViewControllerDelegate

extension NewPostViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        let cell = newPostTableView.cellForRow(at: NSIndexPath(row: 0, section: 0) as IndexPath) as! ThumbnailAndCaptionCell
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: { (object, error) in
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        // Use UIImage
                        print("Selected image: \(image)")
                        print("I'm here")
                        cell.thumbnail.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
                    }
                }
            })
        }
    }
    
    func presentPicker() {
        let configuration = PHPickerConfiguration()
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
}

//MARK: - ThumbnailAndCaptionCellDelegate

extension NewPostViewController: ThumbnailAndCaptionCellDelegate {
    func didPressButton(_ tag: Int) {
        
        presentPicker()
    }
}
