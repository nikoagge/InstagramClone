//
//  UserFollowTableViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 22/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

protocol UserFollowTableViewCellDelegate: AnyObject {
    func userFollowTableViewCellDidTapFollowUnfollowButton(userRelationship: UserRelationship)
}

class UserFollowTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var followUnfollowButton: UIButton!
    
    static let identifier = "UserFollowTableViewCell"
    static let nibName = "UserFollowTableViewCell"
    
    weak var userFollowTableViewCellDelegate: UserFollowTableViewCellDelegate?
    private var userRelationship: UserRelationship?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profilePhotoImageView.image = nil
        nameLabel.text = nil
        userNameLabel.text = nil
        followUnfollowButton.setTitle(nil, for: .normal)
        followUnfollowButton.layer.borderWidth = 0
        followUnfollowButton.backgroundColor = nil
    }
    
    @IBAction func followUnfollowButtonTouchUpInside(_ sender: UIButton) {
        guard let userRelationship = userRelationship else { return }
        userFollowTableViewCellDelegate?.userFollowTableViewCellDidTapFollowUnfollowButton(userRelationship: userRelationship)
    }
    
    func configure(userRelationship: UserRelationship?) {
        self.userRelationship = userRelationship
        nameLabel.text = userRelationship?.name
        userNameLabel.text = userRelationship?.userName
        switch userRelationship?.followState {
        case .following:
            followUnfollowButton.setTitle("Unfollow", for: .normal)
            followUnfollowButton.setTitleColor(.label, for: .normal)
            followUnfollowButton.backgroundColor = .systemBackground
            followUnfollowButton.layer.borderWidth = 1
            followUnfollowButton.layer.borderColor = UIColor.label.cgColor
            
        case .notFollowing:
            followUnfollowButton.setTitle("Follow", for: .normal)
            followUnfollowButton.setTitleColor(.white, for: .normal)
            followUnfollowButton.backgroundColor = .link
            followUnfollowButton.layer.borderWidth = 0
            
        case .none:
            break
        }
    }
}

private extension UserFollowTableViewCell {
    func setupUI() {
        profilePhotoImageView.fround(cornerRadius: profilePhotoImageView.frame.size.width / 2)
    }
}
