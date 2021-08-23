//
//  PostRenderType.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 23/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation

enum PostRenderType {
    case header(provider: User)
    case primaryContent(provider: UserPost)
    case actions(provider: String)
    case comments(comments: [PostComment])
}
