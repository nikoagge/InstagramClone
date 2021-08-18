//
//  AlertPresentable.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 5/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation
import UIKit

protocol AlertPresentable where Self: UIViewController {
    @discardableResult func presentAlert(_ alertType: AlertType) -> AlertViewController
}

extension AlertPresentable {
    @discardableResult func presentAlert(_ alertType: AlertType) -> AlertViewController {
        var alertViewController: AlertViewController!
        
        switch alertType {
        case .loginError:
            alertViewController = AlertViewController(alertTitle: "Log In Error", mainButton: AlertButton(title: "Dismiss", hideAfterAction: true))
            
        case .logoutConfirmation(action: let action): alertViewController = AlertViewController(alertTitle: "Log Out", subtitle: "Are you sure you want to log out?", mainButton: AlertButton(title: "Cancel"), secondaryButton: AlertButton(title: "Log Out", hideAfterAction: true, action: action))
        }
        alertViewController.modalPresentationStyle = .overFullScreen
        self.present(alertViewController, animated: true)
        
        return alertViewController
    }
}
