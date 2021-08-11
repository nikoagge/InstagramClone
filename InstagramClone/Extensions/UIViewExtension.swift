//
//  UIViewExtension.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 2/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fround(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    static func newAutoLayoutView() -> Self {
        let view: UIView = Self()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view as! Self
    }
}
