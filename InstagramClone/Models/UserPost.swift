//
//  UserPost.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 18/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation

public struct UserPost {
    let identifier: String
    let userPostType: UserPostType
    let thumbnailImageURL: URL
    let caption: String
    let postLikes: [PostLike]
    let postComments: [PostComment]
    let createdDate: Date
    let taggedUsers: [User]
}
