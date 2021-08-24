//
//  InstagramFeedPostTableViewCell.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 18/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit
import SDWebImage
import AVFoundation

class InstagramFeedPostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    
    static let identifier = "InstagramFeedPostTableViewCell"
    static let nibName = "InstagramFeedPostTableViewCell"
    
    private var avPlayer: AVPlayer?
    private var avPlayerLayer = AVPlayerLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        postImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        avPlayerLayer.frame = contentView.bounds
    }
    
    func configure(userPost: UserPost) {
        switch userPost.userPostType {
        case .photo:
            postImageView.sd_setImage(with: userPost.postURL, completed: nil)
            
        case .video:
            avPlayer = AVPlayer(url: userPost.postURL)
            avPlayerLayer.player = avPlayer
            avPlayerLayer.player?.volume = 4
            avPlayerLayer.player?.play()
        }
    }
}

private extension InstagramFeedPostTableViewCell {
    func setupUI() {
        contentView.layer.addSublayer(avPlayerLayer)
    }
}
