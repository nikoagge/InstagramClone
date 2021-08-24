//
//  InstagramFeedPostHeaderTableViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 18/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit
import SDWebImage

protocol InstagramFeedPostHeaderTableViewCellDelegate: AnyObject {
    func didTapMoreButton()
}

class InstagramFeedPostHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    static let identifier = "InstagramFeedPostHeaderTableViewCell"
    static let nibName = "InstagramFeedPostHeaderTableViewCell"
    
    weak var instagramFeedPostHeaderTableViewCellDelegate: InstagramFeedPostHeaderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userNameLabel.text = nil
        profilePhotoImageView.image = nil
    }
    
    @IBAction func moreButtonTouchUpInside(_ sender: UIButton) {
        instagramFeedPostHeaderTableViewCellDelegate?.didTapMoreButton()
    }
    
    func configure(user: User) {
        userNameLabel.text = user.userName
        profilePhotoImageView.sd_setImage(with: user.profilePhotoURL, completed: nil)
    }
}

private extension InstagramFeedPostHeaderTableViewCell {
    func setupUI() {
        profilePhotoImageView.fround(cornerRadius: profilePhotoImageView.frame.size.width / 2)
        moreButton.setTitle("", for: .normal)
    }
}
