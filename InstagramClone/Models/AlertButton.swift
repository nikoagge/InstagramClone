//
//  AlertButton.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 5/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation

struct AlertButton {
    let title: String
    let hideAfterAction: Bool
    let action: (() -> ())?
    let actionAfterHide: (() -> ())?
    
    init(title: String, hideAfterAction: Bool = true, action: (() -> ())? = nil, actionAfterHide: (() -> ())? = nil) {
        self.title = title
        self.hideAfterAction = hideAfterAction
        self.action = action
        self.actionAfterHide = actionAfterHide
    }
}
