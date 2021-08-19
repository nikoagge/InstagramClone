//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: GenericViewController {
    @IBOutlet weak var instagramFeedPostsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
    }
}

private extension HomeViewController {
    func setupUI() {
        instagramFeedPostsTableViewConfiguration()
    }
    
    func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            navigate(.init(pageType: .loginViewController, navigationStyle: .present(modalPresentationStyle: .overFullScreen, animated: true)))
        }
    }
    
    func instagramFeedPostsTableViewConfiguration() {
        instagramFeedPostsTableView.register(UINib(nibName: InstagramFeedPostTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: InstagramFeedPostTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let instagramFeedPostTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostTableViewCell.identifier, for: indexPath)
        
        return instagramFeedPostTableViewCell
    }
}
