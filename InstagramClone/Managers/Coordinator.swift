//
//  Coordinator.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

protocol Coordinator where Self: UIViewController {
    func navigate(_ navigationItem: NavigationItem)
}

extension Coordinator {
    func navigate(_ navigationItem: NavigationItem) {
        var controllerToNavigate: UIViewController!
        var controllersForInitialNavigation: [UIViewController] = []
        
        switch navigationItem.pageType {
        case .viewController(let viewController):
            controllerToNavigate = viewController
            
        case .viewControllers(let viewControllers):
            controllersForInitialNavigation = viewControllers
            
        case .loginViewController:
            controllerToNavigate = StoryboardType.login.getController(LoginViewController.self)
            
        case .safariServicesSafariViewController(let url):
            controllerToNavigate = SFSafariViewController(url: url)
            
        case .registrationViewController:
            controllerToNavigate = StoryboardType.registration.getController(RegistrationViewController.self)
            
        case .settingsViewController:
            controllerToNavigate = StoryboardType.settings.getController(SettingsViewController.self)
            
        case .editProfileViewController:
            controllerToNavigate = StoryboardType.editProfile.getController(EditProfileViewController.self)
            
        case .postViewController(let userPost):
            controllerToNavigate = StoryboardType.post.getController(PostViewController.self) { postViewController in
                postViewController.userPost = userPost
            }
            
        case .listViewController(let viewControllerTitle):
            controllerToNavigate = StoryboardType.list.getController(ListViewController.self) { listViewController in
                listViewController.viewControllerTitle = viewControllerTitle
            }
        }
        
        if let controllerToNavigate = controllerToNavigate {
            controllersForInitialNavigation.append(controllerToNavigate)
        }
    
        DispatchQueue.main.async {
            switch navigationItem.navigationStyle {
            case .present(let modalPresentationStyle, let animated):
                controllerToNavigate.modalPresentationStyle = modalPresentationStyle
                self.present(controllerToNavigate, animated: animated)
                
            case .presentAndPopToRootViewController(let modalPresentationStyle, let animated):
                controllerToNavigate.modalPresentationStyle = modalPresentationStyle
                self.present(controllerToNavigate, animated: animated) {
                    self.navigationController?.popToRootViewController(animated: animated)
                    self.tabBarController?.selectedIndex = 0
                }
                
            case .presentWithinNavigation(let animated, let hidesBottomBar, let modalPresentationStyle):
                controllerToNavigate.tabBarController?.hidesBottomBarWhenPushed = hidesBottomBar
                let navigationController = UINavigationController(rootViewController: controllerToNavigate)
                navigationController.modalPresentationStyle = modalPresentationStyle
                self.present(navigationController, animated: animated)
                
            case .push(let animated):
                self.navigationController?.pushViewController(controllerToNavigate, animated: animated)
                
            case .replace(let animated):
                if var viewControllers = self.navigationController?.viewControllers {
                    viewControllers.removeLast()
                    viewControllers.append(controllerToNavigate)
                    self.navigationController?.setViewControllers(controllersForInitialNavigation, animated: animated)
                }
                
            case .setInitialNavigationController(let animated):
                Constants.appDelegate.initialNavigationController.setViewControllers(controllersForInitialNavigation, animated: animated)
            }
        }
    }
}
