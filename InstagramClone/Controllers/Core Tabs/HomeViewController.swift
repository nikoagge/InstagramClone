//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: GenericViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigate(.init(pageType: .loginViewController, navigationStyle: .present(animated: true)))
    }
}

private extension HomeViewController {
    func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            
        }
    }
}
