//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class ProfileViewController: GenericViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

private extension ProfileViewController {
    func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(settingsBarButtonItemTapped))
    }
    
    @objc func settingsBarButtonItemTapped() {
        navigate(.init(pageType: .settingsViewController, navigationStyle: .push(animated: true)))
    }
}
