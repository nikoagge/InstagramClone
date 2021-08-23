//
//  NotificationLikeEventTableViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 22/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit
import SDWebImage

protocol NotificationLikeEventTableViewCellDelegate: AnyObject {
    func notificationLikeEventTableViewCellDidTapRelatedPostButton(userNotification: UserNotification)
}

class NotificationLikeEventTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var notificationLikeLabel: UILabel!
    @IBOutlet weak var postButton: UIButton!
    
    static let identifier = "NotificationLikeEventTableViewCell"
    static let nibName = "NotificationLikeEventTableViewCell"
    
    weak var notificationLikeEventTableViewCellDelegate: NotificationLikeEventTableViewCellDelegate?
    private var userNotification: UserNotification?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        postButton.setBackgroundImage(nil, for: .normal)
        notificationLikeLabel.text = nil
        profilePhotoImageView.image = nil
    }
    
    @IBAction func postButtonTouchUpInside(_ sender: UIButton) {
        guard let userNotification = userNotification else { return }
        notificationLikeEventTableViewCellDelegate?.notificationLikeEventTableViewCellDidTapRelatedPostButton(userNotification: userNotification)
    }
    
    func configure(userNotification: UserNotification) {
        self.userNotification = userNotification
        notificationLikeLabel.text = userNotification.notificationText
        profilePhotoImageView.sd_setImage(with: userNotification.user.profilePhotoURL, completed: nil)
        switch userNotification.userNotificationType {
        case .like(let userPost):
            guard !userPost.thumbnailImageURL.absoluteString.contains("google.com") else { return }
            postButton.sd_setBackgroundImage(with: userPost.thumbnailImageURL, for: .normal, completed: nil)
            
        case .follow:
            break
        }
    }
}

private extension NotificationLikeEventTableViewCell {
    func setupUI() {
        profilePhotoImageView.fround(cornerRadius: profilePhotoImageView.frame.size.width / 2)
        postButton.setTitle("", for: .normal)
    }
}
