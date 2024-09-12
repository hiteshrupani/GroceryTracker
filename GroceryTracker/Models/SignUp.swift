//
//  SignUp.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import Foundation

struct SignUpRequest: Codable {
    var name: String = ""
    var email: String
    var address: String = ""
    var phone: String = ""
    var password: String
//    var profile_image: String
}
