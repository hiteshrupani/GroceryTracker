//
//  EmailVerificationView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import SwiftUI

struct EmailVerificationView: View {
    
    @StateObject var viewModel = EmailVerificationViewModel()
    @StateObject var signupVM = SignupViewModel()
    @State private var email = ""
    
    @Binding var showEmailVerificationView: Bool
    @State var showOTPView: Bool = false
    
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
                
                VStack (alignment: .leading) {
                    
                    // MARK: - Back Button
                    
                    BackButtonView() {
                            // navigate to previous screen
                            showEmailVerificationView = false
                        }
                    
                    Spacer()
                                    
                    // MARK: - Page Title
                    HStack {
                        VStack (alignment: .leading) {
                            
                            Text("Verify your email")
                                .font(.caption)
                            
                            Text("Email Verification")
                                .font(.largeTitle)
                            
                        }
                        
                        Spacer()
                    }
                    .foregroundStyle(Color.white)
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                    .padding(.bottom, 50)

                    // MARK: - TextFields
                    VStack (alignment: .leading) {
                        Text("Enter the email address to get verified")
                            .font(.subheadline)
                            .padding(.bottom)
                        
                        Text("Email")
                            .font(.headline)
                        TextFieldView(isTextVisible: .constant(true), placeholder: "Enter your email", text: $email)
                            .padding(.bottom)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(TextInputAutocapitalization.never)
                        
                        ButtonView(text: "Verify Email Address", action: verifyEmail)
                            
                        // navigate to email verification
                    }
                    .fullScreenCover(isPresented: $showOTPView) {
                        EmailVerificationOTPView(showOTPView: $showOTPView)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func verifyEmail() {
        updateEmail()
        
        viewModel.requestOTP()
        
        signupVM.signUp()
        
        showOTPView = true
    }
    
    func updateEmail() {
        SignupViewModel.shared.user.email = email
        
        viewModel.email = email
//        print(SignupViewModel.shared.user)
    }
}

#Preview {
    EmailVerificationView(showEmailVerificationView: .constant(true))
}
