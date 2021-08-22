//
//  NotificationFollowEventTableViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 22/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

protocol NotificationFollowEventTableViewCellDelegate: AnyObject {
    func notificationFollowEventTableViewCellDidTapFollowUnfollowButton(model: String)
}

class NotificationFollowEventTableViewCell: UITableViewCell {
    static let identifier = "NotificationFollowEventTableViewCell"
    static let nibName = "NotificationFollowEventTableViewCell"
    
    weak var notificationFollowEventTableViewCellDelegate: NotificationFollowEventTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
}
