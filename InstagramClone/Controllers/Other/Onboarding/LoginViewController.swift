//
//  LoginViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class LoginViewController: GenericViewController {
    @IBOutlet weak var usernameOrEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    @IBAction func loginButtonTouchUpInside(_ sender: UIButton) {
        let _ = view.subviews.compactMap { $0 as? UITextField }.map {
            $0.resignFirstResponder()
        }
        
        guard let usernameOrEmail = usernameOrEmailTextField.text, !usernameOrEmail.isEmpty, let password = passwordTextField.text, password.count >= 8 else { return }
        
    }
    
    @IBAction func newUserCreateAnAccountButtonTouchUpInside(_ sender: UIButton) {
    }
    
    @IBAction func termsOfServiceButtonTouchUpInside(_ sender: UIButton) {
        guard let instagramTermsOfServiceURL = URL(string: Constants.instagramTermsOfServiceURL) else { return }
        navigate(.init(pageType: .safariServicesSafariViewController(url: instagramTermsOfServiceURL), navigationStyle: .present(animated: true)))
    }
    
    @IBAction func privacyButtonTouchUpInside(_ sender: UIButton) {
        guard let instagramTermsOfServiceURL = URL(string: Constants.instagramPrivacyURL) else { return }
        navigate(.init(pageType: .safariServicesSafariViewController(url: instagramTermsOfServiceURL), navigationStyle: .present(animated: true)))
    }
}

extension LoginViewController: UITextFieldDelegate {
}

private extension LoginViewController {
    func setupViews() {
        let _ = view.subviews.compactMap { $0 as? UITextField }.map {
            $0.fround(cornerRadius: 8)
            $0.delegate = self
        }
        loginButton.fround(cornerRadius: 8)
    }
}
