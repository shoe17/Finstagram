//
//  CircularImageView.swift
//  Finstagram
//
//  Created by Darian Low on 1/7/21.
//

import UIKit

class CircularImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }

}
