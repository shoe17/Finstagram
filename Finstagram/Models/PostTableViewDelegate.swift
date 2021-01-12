//
//  PostTableViewDelegate.swift
//  Finstagram
//
//  Created by Darian Low on 1/11/21.
//

import UIKit

class PostTableViewDelegate: NSObject, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
