//
//  NewPostViewController.swift
//  Finstagram
//
//  Created by Darian Low on 1/14/21.
//

import UIKit
class NewPostViewController: UIViewController {
    
    var headerView: UIView!
    var imagePreview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        setupImageView()
        displayImagePicker()
        
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        headerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
//        headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
    }
    
    func setupImageView() {
        imagePreview = UIImageView()
        let xPostion:CGFloat = 50
        let yPostion:CGFloat = 200
        let buttonWidth:CGFloat = 200
        let buttonHeight:CGFloat = 200
        
        imagePreview.frame = CGRect(x: xPostion, y: yPostion, width: buttonWidth, height: buttonHeight)
        
        self.view.addSubview(imagePreview)

    }
    
    func displayImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.view.frame = CGRect(x: 0, y: 0, width: 350, height: 450);
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    

    

}

extension NewPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            print("got here")
            imagePreview.image = image
            picker.dismiss(animated: true, completion: nil)
        }


    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
