//
//  SignupView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import SwiftUI

struct SignupView: View {
    @StateObject var viewModel = SignupViewModel()
    @StateObject var emailVM = EmailVerificationViewModel()
    @StateObject var loginVM = LoginViewModel()
    
    @Binding var showSignupView: Bool
    @State var showAlert: Bool = false
    @State var alertMessage: String = "Some error occured!"
    
    @State private var isPasswordVisible: Bool = false
    @State private var isConfirmPasswordVisible: Bool = false
    
    @State private var name: String = SignupViewModel.shared.user.name
    @State private var phone: String = SignupViewModel.shared.user.phone
    @State private var address: String = SignupViewModel.shared.user.address
    @State private var password: String = SignupViewModel.shared.user.password
    @State private var confirmPassword: String = SignupViewModel.shared.user.password
    
    
    
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
                    .frame(width: UIScreen.main.bounds.width / 1, height: UIScreen.main.bounds.height / 1.15)
                    .offset(y: 125)
                    .ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    
                    BackButtonView() {
                        showSignupView.toggle()
                    }
                    
                    
                    Title()
                    
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
                            TextFieldView(isTextVisible: $isConfirmPasswordVisible, isPassword: true, placeholder: "Re-enter your password", text: $confirmPassword)
                                .padding(.bottom)
                            
                            
                            // MARK: - Create Account Button
                            ButtonView(text: "Create Account", action: saveUserDetails)
                                .padding(.top)
                                
                        }
                        
                        
                    }
                }
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error!"),
                  message: Text(alertMessage),
                  dismissButton: .default(Text("OK")))
        }
    }
    
    func saveUserDetails() {
        
        if name.isEmpty || phone.isEmpty || address.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            print("All fields are required")
            
            showAlert = true
            alertMessage = "All fields are required"
            
            return
        }
        
        if password != confirmPassword {
            print("Password do not match")
            
            showAlert = true
            
            return
        }
        
        SignupViewModel.shared.user = SignUpRequest(name: name, email: emailVM.email , address: address, phone: phone, password: password)
        
        viewModel.signUp()
        
        loginVM.email = emailVM.email
        loginVM.password = password
        
        loginVM.login()
    }
    
}

#Preview {
    SignupView(showSignupView: .constant(true))
}

struct Title: View {
    var body: some View {
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
    }
}


