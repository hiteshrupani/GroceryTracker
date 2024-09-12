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
    
    @Environment(\.dismiss) var dismiss
    
    @State var showEmailVerificationOTPView: Bool = false
    
    @State var showAlert = false
    @State var alertMessage = "Some error occured!"
    
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
                            dismiss()
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
                    .fullScreenCover(isPresented: $showEmailVerificationOTPView) {
                        EmailVerificationOTPView(showEmailVerificationOTPView: $showEmailVerificationOTPView)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func verifyEmail() {
        
        if email.isEmpty {
            alertMessage = "Email cannot be empty"
            showAlert.toggle()
            return
        }
        
        if !isValidEmail() {
            alertMessage = "Please enter a valid email"
            showAlert.toggle()
            return
        }
        
        updateEmail()
        
        viewModel.requestOTP()
        
        showEmailVerificationOTPView.toggle()
    }
    
    private func updateEmail() {
        
        viewModel.email = email
//        print(SignupViewModel.shared.user)
    }
    
    private func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

#Preview {
    EmailVerificationView()
}
