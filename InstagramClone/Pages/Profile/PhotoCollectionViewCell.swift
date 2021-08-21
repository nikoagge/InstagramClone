//
//  PhotoCollectionViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 20/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    static let identifier = "PhotoCollectionViewCell"
    static let nibName = "PhotoCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        accessibilityLabel = "User post image"
        accessibilityHint = "Double-tap to open post"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImageView.image = nil
    }
    
    public func configure(userPost: UserPost) {
        photoImageView.sd_setImage(with: userPost.thumbnailImageURL, completed: nil)
    }
    
    public func configure(imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }
}
