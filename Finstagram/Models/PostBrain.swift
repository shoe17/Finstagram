//
//  PostBrain.swift
//  Finstagram
//
//  Created by Darian Low on 1/11/21.
//

import Foundation

class PostBrain {
    var posts = [
        Post(username: "darianlow", location: "Hawaii", profilePic: #imageLiteral(resourceName: "profile_pic"), postImage: #imageLiteral(resourceName: "profile_pic")),
        Post(username: "dionlow", location: "Hawaii", profilePic: #imageLiteral(resourceName: "profile_pic"), postImage: #imageLiteral(resourceName: "profile_pic")),
        Post(username: "ericcao", location: "Iowa", profilePic: #imageLiteral(resourceName: "profile_pic"), postImage: #imageLiteral(resourceName: "profile_pic")),
    ]
    
    func getPosts() -> [Post] {
        return posts
    }
}
