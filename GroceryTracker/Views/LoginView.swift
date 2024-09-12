//
//  LoginView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    @State private var showEmailVerificationView: Bool = false
    @State var showHomeView: Bool = false
    
    @State var isPasswordVisible: Bool = false
    
    @State var showAlert: Bool = false
    @State var alertMessage: String = "Some error occured!"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.background)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(Color.black.opacity(0.5))
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(.background)
                    .frame(width: UIScreen.main.bounds.width / 1, height: UIScreen.main.bounds.height / 1.7)
                    .offset(y: 200)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    // MARK: - App Logo and Name
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundStyle(.white)
                            .padding()
                        Text("Grocery Tracker")
                            .font(.title2)
                            .foregroundStyle(Color.white)
                    }
                    
                    Spacer()
                    
                    // MARK: - Page Title
                    HStack {
                        VStack (alignment: .leading) {
                            
                            Text("Welcome Back")
                                .font(.caption)
                            
                            Text("Sign In")
                                .font(.largeTitle)
                                
                        }
                        
                        Spacer()
                    }
                    .foregroundStyle(Color.white)
                    .frame(width: UIScreen.main.bounds.width / 1.25)
                    .padding(.bottom, 50)

                    
                    
                    
                    // MARK: - TextFields
                    VStack (alignment: .leading) {
                        Text("Email")
                            .font(.headline)
                        TextFieldView(isTextVisible: .constant(true), placeholder: "Enter your email", text: $viewModel.email)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                        
                        Text("Password")
                            .font(.headline)
                            .padding(.top)
                        TextFieldView(isTextVisible: $isPasswordVisible, isPassword: true, placeholder: "Enter your password", text: $viewModel.password)
                            
                            
                            
                        
                        HStack {
                            
                            Spacer()
                            Button{
                                print("Forgot Password Tapped")
                            } label: {
                                Text("Forgot Password")
                                    .font(.headline)
                                    .foregroundStyle(Color.redColour)
                                
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width /  1.2)
                        .padding(.vertical)
                        
                        ButtonView(text: "Login", action: login)
                            .padding(.top)
                        // navigate to home view
                        
                        CreateAccountButton(action: createAccount)
                            .padding(.bottom)
                        
                        // navigate to signup view
                    }
                    .navigationDestination(isPresented: $showEmailVerificationView, destination: {
                        EmailVerificationView()
                    })
                    
                    .navigationDestination(isPresented: $viewModel.isLoggedIn, destination: {
                        HomeView()
                    })
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func login() {
        
        if viewModel.email.isEmpty || viewModel.password.isEmpty {
            alertMessage = "Please enter your email and password"
            showAlert.toggle()
            return
        }
        
        viewModel.login()
    }
    
    private func createAccount() {
        showEmailVerificationView.toggle()
    }
    
}

#Preview {
    LoginView()
}

struct CreateAccountButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button (action: action){
            Text("Create account")
                .padding()
                .frame(width: UIScreen.main.bounds.width /  1.2, height: 50)
                .foregroundStyle(Color.accentColor)
                .background(
                    Capsule()
                    // stroke inside the button
                        .stroke(Color.secondary, lineWidth: 1)
                )
        }
    }
}
