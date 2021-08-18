//
//  GenericViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController, Coordinator, AlertPresentable {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlertController(title: String, message: String?, mainActionTitle: String, mainActionStyle: UIAlertAction.Style, mainAction: (() -> Void)? = nil, secondaryActionTitle: String?, secondaryActionStyle: UIAlertAction.Style, secondaryAction: (() -> Void)? = nil, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let mainAction = UIAlertAction(title: mainActionTitle, style: mainActionStyle) { action in
            if let mainAction = mainAction {
                mainAction()
            }
        }
        alertController.addAction(mainAction)
        if let secondaryActionTitle = secondaryActionTitle {
            let secondaryAction = UIAlertAction(title: secondaryActionTitle, style: secondaryActionStyle) { action in
                if let secondaryAction = secondaryAction {
                    secondaryAction()
                }
            }
            alertController.addAction(secondaryAction)
        }
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func showActionSheetController(title: String, message: String?, alertActions: [UIAlertAction], viewController: UIViewController, sourceView: UIView) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for alertAction in alertActions {
            alertController.addAction(alertAction)
        }
        alertController.popoverPresentationController?.sourceView = sourceView
        alertController.popoverPresentationController?.sourceRect = sourceView.bounds
        viewController.present(alertController, animated: true)
    }
}
