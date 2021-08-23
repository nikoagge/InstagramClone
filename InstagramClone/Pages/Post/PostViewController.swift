//
//  PostViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class PostViewController: GenericViewController {
    @IBOutlet weak var postTableView: UITableView!
    
    var userPost: UserPost?
    var viewControllerTitle: String?
    private var postRenderViewModels = [PostRenderViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        postTableViewConfiguration()
    }
    
    func configureModels() {
        guard let userPost = userPost else { return }
        postRenderViewModels.append(PostRenderViewModel(postRenderType: .header(provider: userPost.owner)))
        postRenderViewModels.append(PostRenderViewModel(postRenderType: .primaryContent(provider: userPost)))
        postRenderViewModels.append(PostRenderViewModel(postRenderType: .actions(provider: "")))
        var postComments = [PostComment]()
        for i in 0..<4 {
            postComments.append(PostComment(identifier: "123_\(i)", userName: "@david", text: "Great post!", createdDate: Date(), likes: []))
        }
    }
}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return postRenderViewModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch postRenderViewModels[section].postRenderType {
        case.actions(_):
            return 1
            
        case .comments(let comments):
            return comments.count > 4 ? 4 : comments.count
            
        case .primaryContent(_):
            return 1
            
        case .header(_):
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch postRenderViewModels[indexPath.section].postRenderType {
        case .primaryContent(let userPost):
            let instagramFeedPostTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostTableViewCell.identifier, for: indexPath)
            
            return instagramFeedPostTableViewCell
            
        case .header(let user):
            let instagramFeedPostHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostHeaderTableViewCell.identifier, for: indexPath)
            
            return instagramFeedPostHeaderTableViewCell
            
        case .actions(let provider):
            let instagramFeedPostActionsTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostActionsTableViewCell.identifier, for: indexPath)
            
            return instagramFeedPostActionsTableViewCell
            
        case .comments(let postComments):
            let instagramFeedPostGeneralTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostGeneralTableViewCell.identifier, for: indexPath)
            
            return instagramFeedPostGeneralTableViewCell
        }
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

private extension PostViewController {
    func setupUI() {
        navigationItem.title = viewControllerTitle
    }
    
    func postTableViewConfiguration() {
        postTableView.register(UINib(nibName: InstagramFeedPostTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: InstagramFeedPostTableViewCell.identifier)
        postTableView.register(UINib(nibName: InstagramFeedPostHeaderTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: InstagramFeedPostHeaderTableViewCell.identifier)
        postTableView.register(UINib(nibName: InstagramFeedPostActionsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: InstagramFeedPostActionsTableViewCell.identifier)
        postTableView.register(UINib(nibName: InstagramFeedPostGeneralTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: InstagramFeedPostGeneralTableViewCell.identifier)
    }
}
