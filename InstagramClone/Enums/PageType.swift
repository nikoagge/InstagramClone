//
//  PageType.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation
import UIKit

enum PageType {
    case viewControllers(viewControllers: [UIViewController])
    case viewController(viewController: UIViewController)
    case loginViewController
    case safariServicesSafariViewController(url: URL)
    case registrationViewController
    case settingsViewController
}
