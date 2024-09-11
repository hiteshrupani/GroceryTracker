//
//  Login.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import Foundation

struct LoginRequest {
    var email: String
    var password: String
}

struct LoginResponse {
    var message: String
    var success: Bool
    var token: String
    var user: User
}

struct User {
    var user_id: String
    var name: String = ""
    var email: String
    var phone: String = ""
    var address: String = ""
//    var profile_image: String
}
