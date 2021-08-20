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

        setupUI()
    }
    
    @IBAction func loginButtonTouchUpInside(_ sender: UIButton) {
        let _ = view.subviews.compactMap { $0 as? UITextField }.map {
            $0.resignFirstResponder()
        }
        
        guard let usernameOrEmail = usernameOrEmailTextField.text, !usernameOrEmail.isEmpty, let password = passwordTextField.text, password.count >= 8 else { return }
        
        var username: String?
        var email: String?
        
        if usernameOrEmail.contains("@"), usernameOrEmail.contains(".") {
            email = usernameOrEmail
        } else {
            username = usernameOrEmail
        }
        
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.presentAlert(.loginError)
                }
            }
        }
    }
    
    @IBAction func newUserCreateAnAccountButtonTouchUpInside(_ sender: UIButton) {
        navigate(.init(pageType: .registrationViewController, navigationStyle: .present(modalPresentationStyle: .automatic, animated: true)))
    }
    
    @IBAction func termsOfServiceButtonTouchUpInside(_ sender: UIButton) {
        guard let instagramTermsOfServiceURL = URL(string: Constants.instagramTermsOfServiceURL) else { return }
        navigate(.init(pageType: .safariServicesSafariViewController(url: instagramTermsOfServiceURL), navigationStyle: .present(modalPresentationStyle: .overFullScreen, animated: true)))
    }
    
    @IBAction func privacyButtonTouchUpInside(_ sender: UIButton) {
        guard let instagramTermsOfServiceURL = URL(string: Constants.instagramPrivacyURL) else { return }
        navigate(.init(pageType: .safariServicesSafariViewController(url: instagramTermsOfServiceURL), navigationStyle: .present(modalPresentationStyle: .overFullScreen, animated: true)))
    }
}

extension LoginViewController: UITextFieldDelegate {
}

private extension LoginViewController {
    func setupUI() {
        let _ = view.subviews.compactMap { $0 as? UITextField }.map {
            $0.fround(cornerRadius: 8)
            $0.delegate = self
        }
        loginButton.fround(cornerRadius: 8)
    }
}
