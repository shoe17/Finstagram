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
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        posts = postBrain.getPosts()
        postTableView.dataSource = self
        postTableView.delegate = self
        
        postTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostReusableCell")
    }
}

//MARK: - UITableViewDelegate and UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("getting size")
        print(posts.count)
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("dequeueing")
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostReusableCell", for: indexPath) as! PostCell
        cell.username.text = posts[indexPath.row].username
        cell.location.text = posts[indexPath.row].location
        cell.profileImage.image = posts[indexPath.row].profilePic
        cell.postImage.image = posts[indexPath.row].postImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touching row")
        print(indexPath.row)
    }
    
    
}

