//
//  PostBrain.swift
//  Finstagram
//
//  Created by Darian Low on 1/11/21.
//

import Foundation

struct PostBrain {
    var posts = [
        Post(username: "darianlow", subtitle: "Hawaii", profilePic: #imageLiteral(resourceName: "profile_pic")),
        Post(username: "dionlow", subtitle: "Hawaii", profilePic: #imageLiteral(resourceName: "profile_pic")),
        Post(username: "ericcao", subtitle: "Iowa", profilePic: #imageLiteral(resourceName: "profile_pic")),
    ]
    
    func getPosts() -> [Post] {
        return posts
    }
}
