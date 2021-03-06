//
//  AlertType.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 5/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation

enum AlertType {
    case loginError
    case logoutConfirmation(action: () -> ())
}
