//
//  ProfileInfoHeaderCollectionReusableView.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 20/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileInfoHeaderCollectionReusableViewDidTapPostsButton(profileInfoHeaderCollectionReusableView: ProfileInfoHeaderCollectionReusableView)
    func profileInfoHeaderCollectionReusableViewDidTapFollowingButton(profileInfoHeaderCollectionReusableView: ProfileInfoHeaderCollectionReusableView)
    func profileInfoHeaderCollectionReusableViewDidTapFollowersButton(profileInfoHeaderCollectionReusableView: ProfileInfoHeaderCollectionReusableView)
    func profileInfoHeaderCollectionReusableViewDidTapEditProfileButton(profileInfoHeaderCollectionReusableView: ProfileInfoHeaderCollectionReusableView)
}

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    static let nibName = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var profileInfoHeaderCollectionReusableViewDelegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    @IBAction func postsButtonTouchUpInside(_ sender: UIButton) {
        profileInfoHeaderCollectionReusableViewDelegate?.profileInfoHeaderCollectionReusableViewDidTapPostsButton(profileInfoHeaderCollectionReusableView: self)
    }
    
    @IBAction func followingButtonTouchUpInside(_ sender: UIButton) {
        profileInfoHeaderCollectionReusableViewDelegate?.profileInfoHeaderCollectionReusableViewDidTapFollowingButton(profileInfoHeaderCollectionReusableView: self)
    }
    
    @IBAction func followersButtonTouchUpInside(_ sender: UIButton) {
        profileInfoHeaderCollectionReusableViewDelegate?.profileInfoHeaderCollectionReusableViewDidTapFollowersButton(profileInfoHeaderCollectionReusableView: self)
    }
    
    @IBAction func editProfileTouchUpInside(_ sender: UIButton) {
        profileInfoHeaderCollectionReusableViewDelegate?.profileInfoHeaderCollectionReusableViewDidTapEditProfileButton(profileInfoHeaderCollectionReusableView: self)
    }
}

private extension ProfileInfoHeaderCollectionReusableView {
    func setupUI() {
        profilePhotoImageView.fround(cornerRadius: 50)
    }
}
