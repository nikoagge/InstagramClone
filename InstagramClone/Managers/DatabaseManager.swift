//
//  DatabaseManager.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    public func canCreateNewUser(username: String, email: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(username: String, email: String, completion: @escaping (Bool) -> Void) {
        Database.database().reference().child(email.databaseSafeKey()).setValue(["username": username]) { error, databaseReference in
            if error == nil {
                completion(true)
                
                return
            } else {
                completion(false)
                
                return
            }
        }
    }
}
