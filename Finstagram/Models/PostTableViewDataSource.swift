//
//  PostTableViewDataSource.swift
//  Finstagram
//
//  Created by Darian Low on 1/11/21.
//

import UIKit

class PostTableViewDataSource: NSObject, UITableViewDataSource {
    
    var posts: [Post]
    
    init(posts: [Post]) {
        self.posts = posts
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostReusableCell", for: indexPath) as! PostCell
        cell.username.text = posts[indexPath.row].username
        cell.location.text = posts[indexPath.row].subtitle
        cell.profileImage.image = posts[indexPath.row].profilePic
        
        return cell
    }
}
