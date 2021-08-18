//
//  NavigationStyle.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation
import UIKit

enum NavigationStyle {
    case present(modalPresentationStyle: UIModalPresentationStyle, animated: Bool)
    case presentWithinNavigation(animated: Bool, hidesBottomBar: Bool)
    case presentAndPopToRootViewController(modalPresentationStyle: UIModalPresentationStyle, animated: Bool)
    case push(animated: Bool)
    case replace(animated: Bool)
    case setInitialNavigationController(animated: Bool)
}
