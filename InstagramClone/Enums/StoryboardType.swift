//
//  StoryboardType.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardType: String {
    case tabBar = "TabBar"
    case launchScreen = "LaunchScreen"
    case home = "Home"
    case explore = "Explore"
    case camera = "Camera"
    case notifications = "Notifications"
    case profile = "Profile"
    case login = "Login"
    case registration = "Registration"
    case settings = "Settings"
    case editProfile = "EditProfile"
    case post = "Post"
    case list = "List"
}

extension StoryboardType {
    func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    func getController<T: UIViewController>(_ type: T.Type, setup: ((T) -> Void) = { _ in }) -> T? {
        if let viewController = self.getStoryboard().instantiateViewController(withIdentifier: String(describing: T.self)) as? T {
            setup(viewController)
            
            return viewController
        }
        
        return nil
    }
}
