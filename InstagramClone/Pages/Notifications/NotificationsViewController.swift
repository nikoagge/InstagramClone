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
    @IBOutlet weak var noNotificationsView: NoNotificationsView!
    @IBOutlet weak var notificationsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        spinnerConfiguration()
        notificationsTableViewConfiguration()
    }
}

extension NotificationsViewController: UITableViewDataSource, UITableViewDelegate {    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
}
