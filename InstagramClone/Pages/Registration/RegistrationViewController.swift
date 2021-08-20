//
//  RegistrationViewController.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case usernameTextField:
            emailTextField.becomeFirstResponder()
            
        case emailTextField:
            passwordTextField.becomeFirstResponder()
            
        default:
            signUpButtonTouchUpInside()
        }
        
        return true
    }
}

private extension RegistrationViewController {
    func setupUI() {
        let _ = view.subviews.compactMap { $0 as? UITextField }.map { $0.delegate = self }
        signUpButton.addTarget(self, action: #selector(signUpButtonTouchUpInside), for: .touchUpInside)
    }
    
    @objc func signUpButtonTouchUpInside() {
        let _ = view.subviews.compactMap { $0 as? UITextField }.map { $0.resignFirstResponder() }
        guard let username = usernameTextField.text, !username.isEmpty, let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty, password.count >= 8 else { return }
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { newUserRegistered in
            DispatchQueue.main.async {
                if newUserRegistered {
                    
                } else {
                    
                }
            }
        }
    }
}
