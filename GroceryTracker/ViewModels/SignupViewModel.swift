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
    
    func signUp() {
            let sessionConfig = URLSessionConfiguration.default

            let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

            guard var URL = URL(string: "https://grocery-backend-t65p.onrender.com/user/sign-up") else {return}
            var request = URLRequest(url: URL)
            request.httpMethod = "POST"

            // Headers

            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

            // JSON Body

            let bodyObject: [String : Any] = [
                "name": "\(user.name)",
                "email": "\(user.email)",
                "address": "\(user.address)",
                "phone": "\(user.phone)",
                "password": "\(user.password)"
                
            ]
            request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

            /* Start a new Task */
            let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                if (error == nil) {
                    // Success
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                }
                else {
                    // Failure
                    print("URL Session Task Failed: %@", error!.localizedDescription);
                }
            })
            task.resume()
            session.finishTasksAndInvalidate()
        }

}
