//
//  ProfileTabsHeaderCollectionReusableView.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 21/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

protocol ProfileTabsHeaderCollectionReusableViewDelegate: AnyObject {
    func profileTabsHeaderCollectionReusableViewDidTapGridButton()
    func profileTabsHeaderCollectionReusableViewDidTapTaggedButton()
}

class ProfileTabsHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var gridButton: UIButton!
    @IBOutlet weak var taggedButton: UIButton!
    
    static let identifier = "ProfileTabsHeaderCollectionReusableView"
    static let nibName = "ProfileTabsHeaderCollectionReusableView"
    
    public weak var profileTabsHeaderCollectionReusableViewDelegate: ProfileTabsHeaderCollectionReusableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    @IBAction func gridButtonTouchUpInside(_ sender: UIButton) {
        toggleButtonsTintColor(isGridButtonSelected: true)
        profileTabsHeaderCollectionReusableViewDelegate?.profileTabsHeaderCollectionReusableViewDidTapGridButton()
    }
    
    @IBAction func taggedButtonTouchUpInside(_ sender: UIButton) {
        toggleButtonsTintColor(isGridButtonSelected: false)
        profileTabsHeaderCollectionReusableViewDelegate?.profileTabsHeaderCollectionReusableViewDidTapTaggedButton()
    }
}

private extension ProfileTabsHeaderCollectionReusableView {
    func setupUI() {
        gridButton.setTitle("", for: .normal)
        taggedButton.setTitle("", for: .normal)
        toggleButtonsTintColor(isGridButtonSelected: true)
    }
    
    func toggleButtonsTintColor(isGridButtonSelected: Bool) {
        gridButton.tintColor = isGridButtonSelected ? .systemBlue : .lightGray
        taggedButton.tintColor = isGridButtonSelected ? .lightGray : .systemBlue
    }
}
