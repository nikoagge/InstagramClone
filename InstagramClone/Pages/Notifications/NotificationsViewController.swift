//
//  NotificationsViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class NotificationsViewController: GenericViewController {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var notificationsTableView: UITableView!
    
    private lazy var noNotificationsView = NoNotificationsView()
    private var userNotifications = [UserNotification]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        spinnerConfiguration()
        notificationsTableViewConfiguration()
        fetchUserNotifications()
    }
}

extension NotificationsViewController: UITableViewDataSource, UITableViewDelegate {    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNotifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch userNotifications[indexPath.row].userNotificationType {
        case .like(_):
            let notificationLikeEventTableViewCell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCell.identifier, for: indexPath) as! NotificationLikeEventTableViewCell
            notificationLikeEventTableViewCell.configure(userNotification: userNotifications[indexPath.row])
            notificationLikeEventTableViewCell.notificationLikeEventTableViewCellDelegate = self
            
            return notificationLikeEventTableViewCell
            
        case .follow:
            let notificationFollowEventTableViewCell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.identifier, for: indexPath) as! NotificationFollowEventTableViewCell
            notificationFollowEventTableViewCell.notificationFollowEventTableViewCellDelegate = self
            
            return notificationFollowEventTableViewCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NotificationsViewController: NotificationLikeEventTableViewCellDelegate {
    func notificationLikeEventTableViewCellDidTapRelatedPostButton(userNotification: UserNotification) {
        switch userNotification.userNotificationType {
        case .like(let userPost):
            navigate(.init(pageType: .postViewController(userPost: userPost, viewControllerTitle: userPost.userPostType.rawValue), navigationStyle: .push(animated: true)))
        case .follow(_):
            fatalError("Dev issue here, should never get there")
        }
    }
}

extension NotificationsViewController: NotificationFollowEventTableViewCellDelegate {
    func notificationFollowEventTableViewCellDidTapFollowUnfollowButton(userNotification: UserNotification) {
    }
}

private extension NotificationsViewController {
    func setupUI() {
        navigationItem.title = "Notifications"
    }
    
    func spinnerConfiguration() {
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
    }
    
    func notificationsTableViewConfiguration() {
        notificationsTableView.register(UINib(nibName: NotificationLikeEventTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: NotificationLikeEventTableViewCell.identifier)
        notificationsTableView.register(UINib(nibName: NotificationFollowEventTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)
    }
    
    func fetchUserNotifications() {
        for i in 0...103 {
            userNotifications.append(UserNotification(userNotificationType: i % 2 == 0 ? .like(userPost: UserPost(identifier: "", userPostType: .photo, thumbnailImageURL: URL(string: "https://www.google.com/")!, postURL: URL(string: "https://www.google.com/")!, caption: "", postLikes: [], postComments: [], createdDate: Date(), taggedUsers: [], owner: User(userName: "Joe", bio: "", name: (first: "Joe", last: "Abraham"), birthDate: Date(), gender: .male, userCounts: UserCount(followers: 4, following: 4, posts: 4), joinDate: Date(), profilePhotoURL: nil))) : .follow(followState: .notFollowing), notificationText: "Notification Sample", user: User(userName: "Joe", bio: "", name: (first: "Joe", last: "Abraham"), birthDate: Date(), gender: .male, userCounts: UserCount(followers: 4, following: 4, posts: 4), joinDate: Date(), profilePhotoURL: nil)))
        }
    }
}
