//
//  ViewController.swift
//  Finstagram
//
//  Created by Darian Low on 1/6/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var postTableView: UITableView!
    
    let postBrain = PostBrain()
    var postDataSource: PostTableViewDataSource!
    var postDelegate: PostTableViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postDataSource = PostTableViewDataSource(posts: postBrain.getPosts())
        postDelegate = PostTableViewDelegate()
        postTableView.dataSource = postDataSource
        postTableView.delegate = postDelegate
        postTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostReusableCell")
    }
    
    @IBAction func newPostPressed(_ sender: UIButton) {
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.sourceType = .photoLibrary
//        imagePickerController.delegate = self
//        imagePickerController.allowsEditing = true
        let vc = NewPostViewController()
        present(vc, animated: true, completion: nil)
    }
}

//extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let newPostController: NewPostViewController
//
//        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            print("got here")
//            newPostController = NewPostViewController(with: image)
//            picker.dismiss(animated: true, completion: nil)
//            present(newPostController, animated: true, completion: nil)
//        }
//        
//        
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//}

