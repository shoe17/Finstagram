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
    
    @IBAction func toNewPostView(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToNewPostView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNewPostView" {
            
        }
    }
}

