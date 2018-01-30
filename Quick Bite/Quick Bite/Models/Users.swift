//
//  Users.swift
//  Quick Bite
//
//  Created by Maciek Girek on 1/29/18.
//  Copyright © 2018 Maciek Girek. All rights reserved.
//

import Foundation
import Firebase

struct User {
    
    let uid: String
    let email: String
    let userName: String
    
    init(authData: User) {
        uid = authData.uid
        email = authData.email
        userName = " "
    }

    init(uid: String, email: String, userName: String) {
        self.uid = uid
        self.email = email
        self.userName = userName
    }
}
