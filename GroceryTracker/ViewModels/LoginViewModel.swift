//
//  LoginViewModel.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 12/09/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    func login() {
        guard let url = URL(string: "https://grocery-backend-t65p.onrender.com/user/sign-in") else { return }
        
        let requestBody: [String: String] = [
            "email": email,
            "password": password
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            print("Error serializing login request body: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.errorMessage = "Network error: \(error?.localizedDescription ?? "Unknown error")"
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                do {
                    let jsonResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    DispatchQueue.main.async {
                        if jsonResponse.success {
                            // Store the token and navigate
                            UserDefaults.standard.set(jsonResponse.token, forKey: "authToken")
                            self.isLoggedIn = true
                        } else {
                            self.errorMessage = jsonResponse.message
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.errorMessage = "Failed to parse response: \(error.localizedDescription)"
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.errorMessage = "Invalid credentials or server error."
                }
            }
        }.resume()
    }
}
