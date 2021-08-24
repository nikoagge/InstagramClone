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
    
    private var homeFeedRenderViewModels = [HomeFeedRenderViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        createMockData()
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
    
    func createMockData() {
        var postComments = [PostComment]()
        for i in 0..<4 {
            postComments.append(PostComment(identifier: "\(i)", userName: "@john", text: "This is some sample text for this post", createdDate: Date(), likes: []))
        }
        for index in 0..<8 {
            let homeFeedRenderViewModel = HomeFeedRenderViewModel(header: PostRenderViewModel(postRenderType: .header(provider: User(userName: "Joe", bio: "", name: (first: "Joe", last: "Abraham"), birthDate: Date(), gender: .male, userCounts: UserCount(followers: 4, following: 4, posts: 4), joinDate: Date(), profilePhotoURL: nil))), post: PostRenderViewModel(postRenderType: .primaryContent(provider: UserPost(identifier: "", userPostType: .photo, thumbnailImageURL: URL(string: "https://www.google.com/")!, postURL: URL(string: "https://www.google.com/")!, caption: "", postLikes: [], postComments: [], createdDate: Date(), taggedUsers: [], owner: User(userName: "Joe", bio: "", name: (first: "Joe", last: "Abraham"), birthDate: Date(), gender: .male, userCounts: UserCount(followers: 4, following: 4, posts: 4), joinDate: Date(), profilePhotoURL: nil)))), actions: PostRenderViewModel(postRenderType: .actions(provider: "")), comments: PostRenderViewModel(postRenderType: .comments(comments: postComments)))
        }
    }
    
    func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            navigate(.init(pageType: .loginViewController, navigationStyle: .present(modalPresentationStyle: .overFullScreen, animated: true)))
        }
    }
    
    func instagramFeedPostsTableViewConfiguration() {
        instagramFeedPostsTableView.register(UINib(nibName: InstagramFeedPostTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: InstagramFeedPostTableViewCell.identifier)
        instagramFeedPostsTableView.register(UINib(nibName: InstagramFeedPostHeaderTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: InstagramFeedPostHeaderTableViewCell.identifier)
        instagramFeedPostsTableView.register(UINib(nibName: InstagramFeedPostGeneralTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: InstagramFeedPostGeneralTableViewCell.identifier)
        instagramFeedPostsTableView.register(UINib(nibName: InstagramFeedPostActionsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: InstagramFeedPostActionsTableViewCell.identifier)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeFeedRenderViewModels.count * 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let homeFeedRenderViewModel: HomeFeedRenderViewModel
        if section == 0 {
            homeFeedRenderViewModel = homeFeedRenderViewModels[0]
        } else {
            let index = section % 4 == 0 ? section / 4 : ((section - (section % 4)) / 4)
            homeFeedRenderViewModel = homeFeedRenderViewModels[index]
        }
        let subSection = section % 4
        if subSection == 0 {
            return 1
        } else if subSection == 1 {
            return 1
        } else if subSection == 2 {
            return 1
        } else {
            switch homeFeedRenderViewModel.comments.postRenderType {
            case .comments(let comments):
                return comments.count > 2 ? 2 : comments.count
                
            case .header, .actions, .primaryContent:
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeFeedRenderViewModel: HomeFeedRenderViewModel
        if indexPath.section == 0 {
            homeFeedRenderViewModel = homeFeedRenderViewModels[0]
        } else {
            let index = indexPath.section % 4 == 0 ? indexPath.section / 4 : ((indexPath.section - (indexPath.section % 4)) / 4)
            homeFeedRenderViewModel = homeFeedRenderViewModels[index]
        }
        let subSection = indexPath.section % 4
        if subSection == 0 {
            switch homeFeedRenderViewModel.header.postRenderType {
            case .header(let user):
                let instagramFeedPostHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostHeaderTableViewCell.identifier, for: indexPath)
                
                return instagramFeedPostHeaderTableViewCell
                
            case .primaryContent, .actions, .comments:
                return UITableViewCell()
            }
        } else if subSection == 1 {
            switch homeFeedRenderViewModel.post.postRenderType {
            case .primaryContent(let post):
                let instagramFeedPostTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostTableViewCell.identifier, for: indexPath)
                
                return instagramFeedPostTableViewCell
                
            case .header, .actions, .comments:
                return UITableViewCell()
            }
        } else if subSection == 2 {
            switch homeFeedRenderViewModel.actions.postRenderType {
            case .actions(let provider):
                let instagramFeedPostActionsTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostActionsTableViewCell.identifier, for: indexPath)
                
                return instagramFeedPostActionsTableViewCell
                
            case .primaryContent, .header, .comments:
                return UITableViewCell()
            }
        } else {
            switch homeFeedRenderViewModel.comments.postRenderType {
            case .comments(let comments):
                let instagramFeedPostGeneralTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostGeneralTableViewCell.identifier, for: indexPath)
                
                return instagramFeedPostGeneralTableViewCell
                
            case .primaryContent, .actions, .header:
                return UITableViewCell()
            }
        }
        
        let instagramFeedPostTableViewCell = tableView.dequeueReusableCell(withIdentifier: InstagramFeedPostTableViewCell.identifier, for: indexPath)
        
        return instagramFeedPostTableViewCell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section % 4 == 3 ? 70 : 0
    }
}
