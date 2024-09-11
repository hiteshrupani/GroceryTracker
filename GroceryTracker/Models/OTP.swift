//
//  OTP.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import Foundation

struct OTPRequest {
    var email: String
    var otp: String
}

struct OTPResponse {
    var message: String
    var success: Bool
}
