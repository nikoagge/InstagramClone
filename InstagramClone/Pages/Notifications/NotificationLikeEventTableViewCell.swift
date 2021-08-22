//
//  NotificationLikeEventTableViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 22/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

protocol NotificationLikeEventTableViewCellDelegate: AnyObject {
    func notificationLikeEventTableViewCellDidTapRelatedPostButton(model: String)
}

class NotificationLikeEventTableViewCell: UITableViewCell {
    static let identifier = "NotificationLikeEventTableViewCell"
    static let nibName = "NotificationLikeEventTableViewCell"
    
    weak var notificationLikeEventTableViewCellDelegate: NotificationLikeEventTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
