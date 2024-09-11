//
//  EmailVerificationView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import SwiftUI

struct EmailVerificationView: View {
    
    @State private var email = ""
    
    var body: some View {
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
                
                Image(systemName: "chevron.left")
                    .foregroundStyle(.background)
                    .padding()
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(Color.white.opacity(0.4))
                    )
                    .padding(.bottom)
                
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
                    
                    ButtonView(text: "Verify Email Address")
                        
                    // navigate to email verification
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    EmailVerificationView()
}
