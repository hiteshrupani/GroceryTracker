//
//  SignupViewModel.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 12/09/24.
//

import Foundation

final class SignupViewModel: ObservableObject {
    
    @Published var user: SignUpRequest = SignUpRequest(email: "", password: "")
    
    static let shared = SignupViewModel()
    private let baseURL = "https://grocery-backend-t65p.onrender.com/user/sign-up"
    
    func signUp(completion: @escaping (Result<Bool, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
            
            print("SIGN UP")
            print(data ?? "")
            print(response ?? "")
            print(error ?? "")
            
            guard let httpResonse = response as? HTTPURLResponse, httpResonse.statusCode == 200 else {
                let apiError = NSError(domain: "API Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to sign up."])
                return
            }
            
            completion(.success(true))
        }
        
        task.resume()
    }
}
