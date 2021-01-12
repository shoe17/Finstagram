//
//  ViewController.swift
//  Finstagram
//
//  Created by Darian Low on 1/6/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var postTableView: UITableView!
    
    var posts = [
        Post(username: "darianlow", subtitle: "Hawaii", profilePic: #imageLiteral(resourceName: "profile_pic")),
        Post(username: "dionlow", subtitle: "Hawaii", profilePic: #imageLiteral(resourceName: "profile_pic")),
        Post(username: "ericcao", subtitle: "Iowa", profilePic: #imageLiteral(resourceName: "profile_pic")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postTableView.dataSource = self
        postTableView.delegate = self
        postTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "PostReusableCell")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "PostReusableCell", for: indexPath) as! PostCell
        cell.username.text = posts[indexPath.row].username
        cell.subtitle.text = posts[indexPath.row].subtitle
        cell.profileImage.image = posts[indexPath.row].profilePic
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
