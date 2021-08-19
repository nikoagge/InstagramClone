//
//  AlertViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 5/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class AlertViewController: GenericViewController {
    let alertTitle: String
    let subtitle: String?
    let mainButton: AlertButton
    let secondaryButton: AlertButton?
    
    private var backgroundWhiteView: UIView = {
        let backgroundWhiteView = UIView.newAutoLayoutView()
        backgroundWhiteView.backgroundColor = .white
        backgroundWhiteView.layer.cornerRadius = 10
        
        return backgroundWhiteView
    }()
    
    private var contentStackView: UIStackView = {
        let contentStackView = UIStackView.newAutoLayoutView()
        contentStackView.axis = .vertical
        contentStackView.distribution = .equalSpacing
        contentStackView.alignment = .center
        contentStackView.spacing = 24
        
        return contentStackView
    }()
    
    private var titleLabel: UILabel = {
        let titleLabel = UILabel.newAutoLayoutView()
        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        return titleLabel
    }()
    
    private var subtitleLabel: UILabel = {
        let subtitleLabel = UILabel.newAutoLayoutView()
        subtitleLabel.font = .systemFont(ofSize: 15)
        subtitleLabel.textColor = .lightGray
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        
        return subtitleLabel
    }()
    
    private var buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView.newAutoLayoutView()
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 6
        
        return buttonsStackView
    }()
    
    private var mainCommonButton: CommonButton = {
        let mainCommonBotton = CommonButton.newAutoLayoutView()
        mainCommonBotton.cornerRadius = 5
        mainCommonBotton.isEnabled = true
        mainCommonBotton.isWhite = false
        
        return mainCommonBotton
    }()
    
    private var secondaryCommonButton: CommonButton = {
        let secondaryCommonButton = CommonButton.newAutoLayoutView()
        secondaryCommonButton.cornerRadius = 5
        secondaryCommonButton.isEnabled = true
        secondaryCommonButton.isWhite = true
        
        return secondaryCommonButton
    }()
    
    required init(alertTitle: String, subtitle: String? = nil, mainButton: AlertButton, secondaryButton: AlertButton? = nil) {
        self.alertTitle = alertTitle
        self.subtitle = subtitle
        self.mainButton = mainButton
        self.secondaryButton = secondaryButton
        
        super.init(nibName: nil, bundle: nil)
        
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

private extension AlertViewController {
    func setupUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        addBackgroundWhiteView()
        addContentStackView()
        addTitleLabel()
        if let subtitle = subtitle {
            addSubtitleLabel(subtitle: subtitle)
        }
        addButtonsStackView()
        if let secondaryButton = secondaryButton {
            addSecondaryButton(secondaryButton: secondaryButton)
        }
        addMainButton()
    }
    
    func addBackgroundWhiteView() {
        view.addSubview(backgroundWhiteView)
        backgroundWhiteView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundWhiteView.topAnchor.constraint(equalTo: view.topAnchor, constant: 27).isActive = true
        backgroundWhiteView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -27).isActive = true
        backgroundWhiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        backgroundWhiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    
    func addContentStackView() {
        backgroundWhiteView.addSubview(contentStackView)
        contentStackView.leadingAnchor.constraint(equalTo: backgroundWhiteView.leadingAnchor, constant: 15).isActive = true
        contentStackView.trailingAnchor.constraint(equalTo: backgroundWhiteView.trailingAnchor, constant: -15).isActive = true
        contentStackView.topAnchor.constraint(equalTo: backgroundWhiteView.topAnchor, constant: 40).isActive = true
    }
    
    func addButtonsStackView() {
        backgroundWhiteView.addSubview(buttonsStackView)
        buttonsStackView.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 30).isActive = true
        buttonsStackView.bottomAnchor.constraint(equalTo: backgroundWhiteView.bottomAnchor, constant: -40).isActive = true
        buttonsStackView.leadingAnchor.constraint(equalTo: backgroundWhiteView.leadingAnchor, constant: 15).isActive = true
        buttonsStackView.trailingAnchor.constraint(equalTo: backgroundWhiteView.trailingAnchor, constant: -15).isActive = true
    }
    
    func addTitleLabel() {
        titleLabel.text = alertTitle
        contentStackView.addArrangedSubview(titleLabel)
    }
    
    func addSubtitleLabel(subtitle: String) {
        subtitleLabel.text = subtitle
        contentStackView.addArrangedSubview(subtitleLabel)
    }
    
    func addMainButton() {
        mainCommonButton.setTitle(mainButton.title, for: .normal)
        mainCommonButton.titleLabel?.numberOfLines = 0
        mainCommonButton.titleLabel?.textAlignment = .center
        mainCommonButton.addTarget(self, action: #selector(mainButtonAction), for: .touchUpInside)
        buttonsStackView.addArrangedSubview(mainCommonButton)
    }
    
    func addSecondaryButton(secondaryButton: AlertButton) {
        secondaryCommonButton.setTitle(secondaryButton.title, for: .normal)
        secondaryCommonButton.addTarget(self, action: #selector(secondaryButtonAction), for: .touchUpInside)
        buttonsStackView.addArrangedSubview(secondaryCommonButton)
    }
    
    @objc func mainButtonAction() {
        if let mainButtonAction = mainButton.action {
            mainButtonAction()
        }
        if mainButton.hideAfterAction {
            self.dismiss(animated: true, completion: mainButton.actionAfterHide)
        }
    }
    
    @objc func secondaryButtonAction() {
        guard let secondaryButton = secondaryButton else { return }
        if let secondaryButtonAction = secondaryButton.action {
            secondaryButtonAction()
        }
        if secondaryButton.hideAfterAction {
            self.dismiss(animated: true, completion: secondaryButton.actionAfterHide)
        }
    }
}
