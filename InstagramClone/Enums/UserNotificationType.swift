//
//  UserNotificationType.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 22/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation

enum UserNotificationType {
    case like(userPost: UserPost)
    case follow(followState: FollowState)
}
