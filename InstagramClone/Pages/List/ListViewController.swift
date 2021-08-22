//
//  ListViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class ListViewController: GenericViewController {
    @IBOutlet weak var followersListTableView: UITableView!
    
    var viewControllerTitle: String?
    var userRelationships = [UserRelationship]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        followersListTableViewConfiguration()
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userRelationships.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userFollowTableViewCell = tableView.dequeueReusableCell(withIdentifier: UserFollowTableViewCell.identifier, for: indexPath) as! UserFollowTableViewCell
        userFollowTableViewCell.configure(userRelationship: userRelationships[indexPath.row])
        userFollowTableViewCell.userFollowTableViewCellDelegate = self
        
        return userFollowTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListViewController: UserFollowTableViewCellDelegate {
    func userFollowTableViewCellDidTapFollowUnfollowButton(userRelationship: UserRelationship) {
        switch userRelationship.followState {
        case .following:
            break
            
        case .notFollowing:
            break
        }
    }
}

private extension ListViewController {
    func setupUI() {
        title = viewControllerTitle
    }
    
    func followersListTableViewConfiguration() {
        followersListTableView.register(UINib(nibName: UserFollowTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: UserFollowTableViewCell.identifier)
    }
}
