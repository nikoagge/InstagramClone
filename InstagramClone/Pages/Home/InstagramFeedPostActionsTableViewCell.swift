//
//  InstagramFeedPostActionsTableViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 18/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

protocol InstagramFeedPostActionsTableViewCellDelegate: AnyObject {
    func didTapLikeButton()
    func didTapCommentButton()
    func didTapSendButton()
}

class InstagramFeedPostActionsTableViewCell: UITableViewCell {
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    static let identifier = "InstagramFeedPostActionsTableViewCell"
    static let nibName = "InstagramFeedPostActionsTableViewCell"
    
    weak var instagramFeedPostActionsTableViewCellDelegate: InstagramFeedPostActionsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    @IBAction func likeButtonTouchUpInside(_ sender: UIButton) {
        instagramFeedPostActionsTableViewCellDelegate?.didTapLikeButton()
    }
    
    @IBAction func commentButtonTouchUpInside(_ sender: UIButton) {
        instagramFeedPostActionsTableViewCellDelegate?.didTapCommentButton()
    }
    
    @IBAction func sendButtonTouchUpInside(_ sender: UIButton) {
        instagramFeedPostActionsTableViewCellDelegate?.didTapSendButton()
    }
    
    func configure(userPost: UserPost) {
    }
}

private extension InstagramFeedPostActionsTableViewCell {
    func setupUI() {
        let _ = contentView.subviews.compactMap { $0 as? UIButton }.map { $0.setTitle("", for: .normal) }
    }
}
