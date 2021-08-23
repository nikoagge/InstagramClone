//
//  NotificationFollowEventTableViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 22/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

protocol NotificationFollowEventTableViewCellDelegate: AnyObject {
    func notificationFollowEventTableViewCellDidTapFollowUnfollowButton(userNotification: UserNotification)
}

class NotificationFollowEventTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var notificationFollowTextLabel: UILabel!
    @IBOutlet weak var followUnfollowButton: UIButton!
    
    static let identifier = "NotificationFollowEventTableViewCell"
    static let nibName = "NotificationFollowEventTableViewCell"
    
    weak var notificationFollowEventTableViewCellDelegate: NotificationFollowEventTableViewCellDelegate?
    private var userNotification: UserNotification?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        configureForFollowFollowUnfollowButton()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        followUnfollowButton.setTitle(nil, for: .normal)
        followUnfollowButton.backgroundColor = nil
        followUnfollowButton.layer.borderWidth = 0
        notificationFollowTextLabel.text = nil
        profilePhotoImageView.image = nil
    }
    
    @IBAction func followUnfollowButtonTouchUpInside(_ sender: UIButton) {
        guard let userNotification = userNotification else { return }
        notificationFollowEventTableViewCellDelegate?.notificationFollowEventTableViewCellDidTapFollowUnfollowButton(userNotification: userNotification)
    }
    
    func configure(userNotification: UserNotification) {
        self.userNotification = userNotification
        notificationFollowTextLabel.text = userNotification.notificationText
        profilePhotoImageView.sd_setImage(with: userNotification.user.profilePhotoURL, completed: nil)
        switch userNotification.userNotificationType {
        case .like(_):
            break
            
        case .follow(let followState):
            switch followState {
            case .following:
                configureForFollowFollowUnfollowButton()
                
            case .notFollowing:
                configureForUnFollowFollowUnfollowButton()
            }
        }
    }
}

private extension NotificationFollowEventTableViewCell {
    func setupUI() {
        profilePhotoImageView.fround(cornerRadius: profilePhotoImageView.frame.size.width / 2)
        followUnfollowButton.fround(cornerRadius: 4)
    }
    
    func configureForFollowFollowUnfollowButton() {
        followUnfollowButton.setTitle("Unfollow", for: .normal)
        followUnfollowButton.setTitleColor(.label, for: .normal)
        followUnfollowButton.layer.borderWidth = 1
        followUnfollowButton.layer.borderColor = UIColor.secondaryLabel.cgColor
    }
    
    func configureForUnFollowFollowUnfollowButton() {
        followUnfollowButton.setTitle("Follow", for: .normal)
        followUnfollowButton.setTitleColor(.white, for: .normal)
        followUnfollowButton.layer.borderWidth = 0
        followUnfollowButton.backgroundColor = .link
    }
}
