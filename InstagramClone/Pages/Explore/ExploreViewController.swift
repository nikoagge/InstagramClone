//
//  ExploreViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class ExploreViewController: GenericViewController {
    @IBOutlet weak var exploreSearchBar: UISearchBar!
    @IBOutlet weak var exploreCollectionView: UICollectionView!
    
    private let dimmedView: UIView = {
        let dimmedView = UIView()
        dimmedView.backgroundColor = .black
        dimmedView.isHidden = true
        dimmedView.alpha = 0
        
        return dimmedView
    }()
    
    private var userPosts = [UserPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        dimmedView.frame = view.bounds
    }
}

extension ExploreViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        didCancelSearch()
        guard let searchBarText = searchBar.text, !searchBarText.isEmpty else { return }
        performSearch(searchText: searchBarText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didCancelSearch))
        dimmedView.isHidden = false
        UIView.animate(withDuration: 0.2) {
            self.dimmedView.alpha = 0.4
        }
    }
}

extension ExploreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 130
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let photoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        photoCollectionViewCell.configure(imageName: "mountain")
        
        return photoCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        navigate(.init(pageType: .postViewController(userPost: UserPost(identifier: "", userPostType: .photo, thumbnailImageURL: URL(string: "https://www.google.com/")!, postURL: URL(string: "https://www.google.com/")!, caption: "", postLikes: [], postComments: [], createdDate: Date(), taggedUsers: [], owner: User(userName: "Joe", bio: "", name: (first: "Joe", last: "Abraham"), birthDate: Date(), gender: .male, userCounts: UserCount(followers: 4, following: 4, posts: 4), joinDate: Date(), profilePhotoURL: nil)), viewControllerTitle: "Photo"), navigationStyle: .push(animated: true)))
    }
}

private extension ExploreViewController {
    func setupUI() {
        exploreSearchBar.delegate = self
        exploreCollectionViewConfiguration()
        dimmedViewConfiguration()
    }
    
    func exploreCollectionViewConfiguration() {
        exploreCollectionView.register(UINib(nibName: PhotoCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: (view.frame.size.width - 4) / 3, height: (view.frame.size.width - 4) / 3)
        collectionViewFlowLayout.minimumLineSpacing = 1
        collectionViewFlowLayout.minimumInteritemSpacing = 1
        exploreCollectionView.collectionViewLayout = collectionViewFlowLayout
    }
    
    func dimmedViewConfiguration() {
        view.addSubview(dimmedView)
        let dimmedViewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didCancelSearch))
        dimmedViewTapGestureRecognizer.numberOfTapsRequired = 1
        dimmedViewTapGestureRecognizer.numberOfTouchesRequired = 1
        dimmedView.addGestureRecognizer(dimmedViewTapGestureRecognizer)
    }
    
    func performSearch(searchText: String) {
    }
    
    @objc func didCancelSearch() {
        exploreSearchBar.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
        UIView.animate(withDuration: 0.2, animations: {
            self.dimmedView.alpha = 0
        }) { done in
            if done {
                self.dimmedView.isHidden = true
            }
        }
    }
}
