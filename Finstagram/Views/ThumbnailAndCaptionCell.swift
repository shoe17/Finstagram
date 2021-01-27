//
//  ThumbnailAndCaptionCell.swift
//  Finstagram
//
//  Created by Darian Low on 1/27/21.
//

import UIKit

class ThumbnailAndCaptionCell: UITableViewCell {
    
    @IBOutlet var thumbnail: UIButton!
    @IBOutlet var caption: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 70, weight: .regular, scale: .medium)
        let largePhoto = UIImage(systemName: "photo", withConfiguration: largeConfig)
        thumbnail.setImage(largePhoto, for: .normal)
        
        caption.delegate = self
        caption.text = "Write a caption..."
        caption.textColor = UIColor.lightGray
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//MARK: - UITextViewDelegate

extension ThumbnailAndCaptionCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black
            }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }
}
