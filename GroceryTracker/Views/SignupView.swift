//
//  SignupView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import SwiftUI

struct SignupView: View {
    @State private var isPasswordVisible: Bool = false
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .overlay(Color.black.opacity(0.5))
            
            RoundedRectangle(cornerRadius: 30)
                .fill(.background)
                .frame(width: UIScreen.main.bounds.width / 1, height: UIScreen.main.bounds.height / 1.15)
                .offset(y: 125)
                .ignoresSafeArea()
            
            VStack (alignment: .leading) {
                
                // MARK: - Back Button

                Image(systemName: "chevron.left")
                    .foregroundStyle(.background)
                    .padding()
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.4))
                    )
                    .padding(.bottom)
                
                // MARK: - Page Title
                HStack {
                    VStack (alignment: .leading) {
                        
                        Text("Create your account")
                            .font(.caption)
                        
                        Text("Sign Up")
                            .font(.largeTitle)
                            
                    }
                    
                    Spacer()
                }
                .foregroundStyle(Color.white)
                .frame(width: UIScreen.main.bounds.width / 1.2)
                .padding(.bottom, 50)

                
                
                
                // MARK: - TextFields
                ScrollView (.vertical, showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        Image (systemName: "person")
                            .imageScale(.large)
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.secondary)
                            .overlay(
                                Circle()
                                    .stroke(Color.secondary, lineWidth: 1)
                            )
                            .padding(.bottom)
                        
                        Text("Name")
                            .font(.headline)
                        TextFieldView(isTextVisible: .constant(true), placeholder: "Enter your name", text: $name)
                            .padding(.bottom)
                        
                        Text("Phone")
                            .font(.headline)
                        TextFieldView(isTextVisible: .constant(true), placeholder: "Enter your phone number", text: $phone)
                            .padding(.bottom)
                        
                        Text("Address")
                            .font(.headline)
                        TextFieldView(isTextVisible: .constant(true), placeholder: "Enter your username", text: $address, isMultiLine: true, height: 100)
                            .padding(.bottom)

                        Text("Password")
                            .font(.headline)
                        TextFieldView(isTextVisible: $isPasswordVisible, isPassword: true, placeholder: "Enter your password", text: $password)
                            .padding(.bottom)

                        Text("Confirm Password")
                            .font(.headline)
                        TextFieldView(isTextVisible: $isPasswordVisible, isPassword: true, placeholder: "Re-enter your password", text: $confirmPassword)
                            .padding(.bottom)
                        
                        ButtonView(text: "Create Account")
                            .padding(.top)
                        // navigate to email verification
                    }
                }
            }
        }
    }
}

#Preview {
    SignupView()
}
