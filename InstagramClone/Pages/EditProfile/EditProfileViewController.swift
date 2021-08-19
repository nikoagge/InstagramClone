//
//  EditProfileViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class EditProfileViewController: GenericViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension EditProfileViewController {
    func setupUI() {
        navigationBarConfiguration()
    }
    
    func navigationBarConfiguration() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveBarButtonItemTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelBarButtonItemTapped))
        navigationItem.title = "Edit Profile"
    }
    
    @objc func saveBarButtonItemTapped() {
        
    }
    
    @objc func cancelBarButtonItemTapped() {
        
    }
    
    @objc func changeProfilePictureTapped() {
        let alertActions = [UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }), UIAlertAction(title: "Choose from Library", style: .default, handler: { _ in
            
        }), UIAlertAction(title: "Cancel", style: .cancel)]
        showActionSheetController(title: "Profile Picture", message: "Change profile picture", alertActions: alertActions, viewController: self, sourceView: view)
    }
}
