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
        newPostTableView.allowsSelection = true
        
    }
    
    @IBAction func shareButtonPressed(_ sender: UIBarButtonItem) {
        let cell = newPostTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ThumbnailAndCaptionCell
        print(cell.thumbnail!)
        print(cell.caption!)
    }
}

//MARK: - UITableViewDataSource and UITableViewDelegate

extension NewPostViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //add thumbnail and caption cell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThumbnailAndCaptionCell", for: indexPath) as! ThumbnailAndCaptionCell
            cell.thumbnailAndCaptionCellDelegate = self
            cell.thumbnail.tag = indexPath.row
            cell.thumbnail.contentMode = .scaleAspectFit
            return cell
        }
        return UITableViewCell()
        
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
