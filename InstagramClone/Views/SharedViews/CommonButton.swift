//
//  CommonButton.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 5/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

@IBDesignable final class CommonButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 4 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var isWhite: Bool = false {
        didSet {
            setupButton()
        }
    }
    override var isEnabled: Bool {
        didSet {
            refresh()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
    
    override func prepareForInterfaceBuilder() {
        refresh()
    }
    
    func setupButton() {
        heightAnchor.constraint(equalToConstant: min(50, UIScreen.main.bounds.size.height * 0.075)).isActive = true
        titleLabel?.font = .systemFont(ofSize: 13)
        
        refresh()
    }
    
    func refresh() {
        setupBackgroundColor()
        setupBorder()
        layer.cornerRadius = cornerRadius
        setTitleColor(isWhite ? UIColor(red: 0, green: 60, blue: 150) : .white, for: .normal)
        setTitleColor(isWhite ? UIColor(red: 0, green: 60, blue: 150) : .white, for: .disabled)
    }
    
    private func setupBackgroundColor() {
        backgroundColor = isWhite ? .white : isEnabled ? UIColor(red: 0, green: 60, blue: 150) : UIColor(red: 163, green: 181, blue: 212)
    }
    
    private func setupBorder() {
        layer.borderWidth = isWhite ? 1 : 0
        layer.borderColor = isWhite ? UIColor(red: 0, green: 60, blue: 150).cgColor : .none
    }
}
