//
//  Email.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import Foundation

struct EmailRequest {
    var email: String
    var reason: String = " sign-up"
}

struct EmailResponse {
    var message: String
    var success: Bool
}
