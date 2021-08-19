//
//  StorageManager.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 1/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation
import FirebaseStorage

public class StorageManager {
    static let shared = StorageManager()
    private let storageReference = Storage.storage().reference()
    
    public func uploadUserPost(userPost: UserPost, completion: @escaping (Result<URL, Error>) -> Void) {
    }
    
    public func downloadImage(referencePath: String, completion: @escaping (Result<URL, StorageManagerError>) -> Void) {
        storageReference.child(referencePath).downloadURL { url, error in
            guard let url = url, error == nil else {
                
                completion(.failure(.failedToDownload))
                
                return
            }
            
            completion(.success(url))
        }
    }
}
