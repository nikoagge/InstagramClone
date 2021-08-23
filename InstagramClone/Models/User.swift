//
//  User.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 21/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation

struct User {
    let userName: String
    let bio: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let userCounts: UserCount
    let joinDate: Date
    let profilePhotoURL: URL?
}
