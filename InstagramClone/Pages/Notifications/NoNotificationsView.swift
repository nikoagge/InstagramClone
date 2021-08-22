//
//  NoNotificationsView.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 22/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class NoNotificationsView: UIView {
    private let noNotificationsLabel: UILabel = {
        let noNotificationsLabel = UILabel()
        noNotificationsLabel.text = "No notifications"
        noNotificationsLabel.textColor = .secondaryLabel
        noNotificationsLabel.textAlignment = .center
        noNotificationsLabel.numberOfLines = 1
        
        return noNotificationsLabel
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .secondaryLabel
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "bell")
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(noNotificationsLabel)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: (self.frame.width - 50) / 2, y: 0, width: 50, height: 50).integral
        noNotificationsLabel.frame = CGRect(x: 0, y: imageView.frame.origin.y + imageView.frame.size.height, width: frame.size.width, height: frame.size.height - 50).integral
    }
}
