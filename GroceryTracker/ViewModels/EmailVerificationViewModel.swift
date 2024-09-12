//
//  EmailVerificationViewModel.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 12/09/24.
//

import Foundation

final class EmailVerificationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var otp: String = ""
    @Published var otpMessage: String = ""
    @Published var isOTPSent: Bool = false
    @Published var isVerified: Bool = false
    
    func requestOTP() {
        let url = URL(string: "https://grocery-backend-t65p.onrender.com/user/request-otp")!
        let parameters: [String: Any] = ["email": email, "reason": " sign-up"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            print("REQUEST")
            print(data)
            print(response ?? "no response")
            print(error ?? "no error")
            
            if let response = try? JSONDecoder().decode(EmailResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.isOTPSent = response.success
                    self.otpMessage = response.message
                }
            }
        }.resume()
    }
    
    // Function to verify OTP
    func verifyOTP() {
        let url = URL(string: "https://grocery-backend-t65p.onrender.com/user/verifyOtp")!
        let parameters: [String: Any] = ["email": email, "otp": otp]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            
            print("VERIFY")
            print(data)
            print(response ?? "no response")
            print(error ?? "no error")
            
            if let response = try? JSONDecoder().decode(OTPResponse.self, from: data) {
                DispatchQueue.main.async {
                    self.isVerified = response.success
                    self.otpMessage = response.message
                }
            }
        }.resume()
    }
}

