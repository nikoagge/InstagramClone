//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class ProfileViewController: GenericViewController {
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    private var userPosts = [UserPost]()
    var userRelationships = [UserRelationship]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        profileCollectionViewConfiguration()
        fillUserRelationshipsWithData()
    }
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        
        return userPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        photoCollectionViewCell.configure(userPost: userPosts[indexPath.row])
        
        return photoCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        navigate(.init(pageType: .postViewController(userPost: userPosts[indexPath.row]), navigationStyle: .push(animated: true)))
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else { return UICollectionReusableView() }
        
        if indexPath.section == 1 {
            let profileTabsHeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileTabsHeaderCollectionReusableView.identifier, for: indexPath) as! ProfileTabsHeaderCollectionReusableView
            profileTabsHeaderCollectionReusableView.profileTabsHeaderCollectionReusableViewDelegate = self
            
            return profileTabsHeaderCollectionReusableView
        }
        
        let profileInfoHeaderCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier, for: indexPath) as! ProfileInfoHeaderCollectionReusableView
        profileInfoHeaderCollectionReusableView.profileInfoHeaderCollectionReusableViewDelegate = self
        
        return profileInfoHeaderCollectionReusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height / 3)
        }
        
        return CGSize(width: collectionView.frame.width, height: 65)
    }
}

extension ProfileViewController: ProfileInfoHeaderCollectionReusableViewDelegate {
    func profileInfoHeaderCollectionReusableViewDidTapPostsButton(profileInfoHeaderCollectionReusableView: ProfileInfoHeaderCollectionReusableView) {
        profileCollectionView.scrollToItem(at: IndexPath(row: 0, section: 1), at: .top, animated: true)
    }
    
    func profileInfoHeaderCollectionReusableViewDidTapFollowingButton(profileInfoHeaderCollectionReusableView: ProfileInfoHeaderCollectionReusableView) {
        navigate(.init(pageType: .listViewController(viewControllerTitle: "Following", userRelationships: userRelationships), navigationStyle: .push(animated: true)))
    }
    
    func profileInfoHeaderCollectionReusableViewDidTapFollowersButton(profileInfoHeaderCollectionReusableView: ProfileInfoHeaderCollectionReusableView) {
        navigate(.init(pageType: .listViewController(viewControllerTitle: "Followers", userRelationships: userRelationships), navigationStyle: .push(animated: true)))
    }
    
    func profileInfoHeaderCollectionReusableViewDidTapEditProfileButton(profileInfoHeaderCollectionReusableView: ProfileInfoHeaderCollectionReusableView) {
        navigate(.init(pageType: .editProfileViewController, navigationStyle: .presentWithinNavigation(animated: true, hidesBottomBar: true, modalPresentationStyle: .overFullScreen)))
    }
}

extension ProfileViewController: ProfileTabsHeaderCollectionReusableViewDelegate {
    func profileTabsHeaderCollectionReusableViewDidTapGridButton() {
    }
    
    func profileTabsHeaderCollectionReusableViewDidTapTaggedButton() {
    }
}

private extension ProfileViewController {
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(settingsBarButtonItemTapped))
    }
    
    func profileCollectionViewConfiguration() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.minimumLineSpacing = 1
        collectionViewFlowLayout.minimumInteritemSpacing = 1
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        collectionViewFlowLayout.itemSize = CGSize(width: (view.frame.width - 4) / 3, height: (view.frame.width - 4) / 3)
        profileCollectionView.collectionViewLayout = collectionViewFlowLayout
        profileCollectionView.register(UINib(nibName: PhotoCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        profileCollectionView.register(UINib(nibName: ProfileInfoHeaderCollectionReusableView.nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier)
        profileCollectionView.register(UINib(nibName: ProfileTabsHeaderCollectionReusableView.nibName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileTabsHeaderCollectionReusableView.identifier)
    }
    
    func fillUserRelationshipsWithData() {
        for i in 0..<13 {
            userRelationships.append(UserRelationship(name: "Joe Smith", userName: "@joe", followState: i % 2 == 0 ? .following : .notFollowing))
        }
    }
    
    @objc func settingsBarButtonItemTapped() {
        navigate(.init(pageType: .settingsViewController, navigationStyle: .push(animated: true)))
    }
}
