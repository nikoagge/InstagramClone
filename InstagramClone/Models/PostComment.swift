//
//  PostComment.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 20/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation

struct PostComment {
    let identifier: String
    let userName: String
    let text: String
    let createdDate: Date
    let likes: [PostLike]
}
