//
//  StringExtension.swift
//  InstagramClone
//
//  Created by Nikos Aggelidis on 11/8/21.
//  Copyright © 2021 NAPPS. All rights reserved.
//

import Foundation

extension String {
    func databaseSafeKey() -> String {
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}
