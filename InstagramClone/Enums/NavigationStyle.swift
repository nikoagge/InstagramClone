//
//  NavigationStyle.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation

enum NavigationStyle {
    case present(animated: Bool)
    case presentWithinNavigation(animated: Bool, hidesBottomBar: Bool)
    case push(animated: Bool)
    case replace(animated: Bool)
    case setInitialNavigationController(animated: Bool)
}
