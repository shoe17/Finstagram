//
//  PostCell.swift
//  Finstagram
//
//  Created by Darian Low on 1/7/21.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet var profileImage: CircularImageView!
    
    @IBOutlet var username: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var postImage: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
