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

struct EmailRequest: Codable {
    var email: String
    
    var reason: String = " sign-up"
}

struct EmailResponse: Codable {
    var message: String
    var success: Bool
}

struct OTPRequest: Codable {
    var email: String
    var otp: String
}

struct OTPResponse: Codable {
    var message: String
    var success: Bool
}
