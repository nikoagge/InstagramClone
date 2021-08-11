//
//  AuthManager.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared.canCreateNewUser(username: username, email: email) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
                    guard authDataResult != nil, error == nil else {
                        completion(false)
                        
                        return
                    }
                    
                    DatabaseManager.shared.insertNewUser(username: username, email: email) { newUserInserted in
                        if newUserInserted {
                            completion(true)
                            
                            return
                        } else {
                            completion(false)
                            
                            return
                        }
                    }
                }
            } else {
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
                guard authDataResult != nil, error == nil else {
                    completion(false)
                    
                    return
                }
                completion(true)
            }
        } else if let username = username {
        }
    }
}
