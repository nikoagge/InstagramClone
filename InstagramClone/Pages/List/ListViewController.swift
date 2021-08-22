//
//  ListViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class ListViewController: GenericViewController {
    var viewControllerTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

private extension ListViewController {
    func setupUI() {
        title = viewControllerTitle
    }
}
