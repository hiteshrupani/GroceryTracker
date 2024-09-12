//
//  EmailVerificationOTPView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import SwiftUI

struct EmailVerificationOTPView: View {
    @State private var email = "lol@gmail.com"
    @State private var otp = Array(repeating: "", count: 4)
    @State private var timeRemaining: Int = 60
    @State private var canResend: Bool = true
    @FocusState private var inFocus: Int?
    
    @Binding var showOTPView: Bool
    
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
                    
                    BackButtonView {
                        showOTPView = false
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
                    .padding(.top, 50)
                    .padding(.bottom, 25)
                    
                    
                    // MARK: - Content
                    VStack (alignment: .leading) {
                        Text("Enter the verification code we just sent to your email address")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        
                        Text(email)
                            .font(.headline)
                        
                        // MARK: - OTP Fields
                        
                        HStack(alignment: .center, spacing: 15) {
                            ForEach(0..<4) { index in
                                OTPTextField(otp: $otp[index])
                                    .onChange(of: otp[index]) { newValue in
                                        if newValue.count > 1 {
                                            otp[index] = String(newValue.last!)
                                        }
                                        
                                        if newValue.count == 1 {
                                            moveToNextField(current: index)
                                        }
                                    }
                                    .focused($inFocus, equals: index)
                            }
                        }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .center)
                        
                        // MARK: - Resend OTP
                        
                        HStack {
                            Text("\(formattedTime(timeRemaining))")
                                .font(.subheadline)
                            Button(action: resendOTP) {
                                Text("Resend OTP")
                                    .font(.subheadline)
                                    .foregroundStyle(canResend ? Color.accentColor : .secondary)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .center)
                        
                        ButtonView(text: "Create Account", action: {})
                            .padding(.top)
                        // navigate to email verification
                    }
                    
                    Spacer()
                }
                .onAppear{
                    startTimer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func startTimer() {
        canResend = false
        timeRemaining = 60
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                canResend = true
            }
        }
    }
    
    func resendOTP() {
        
    }
    
    func formattedTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func moveToNextField(current index: Int) {
        if index < otp.count - 1 {
            inFocus = index + 1
        }
    }
    
}


#Preview {
    EmailVerificationOTPView(showOTPView: .constant(true))
}

struct OTPTextField: View {
    @Binding var otp: String
    
    var body: some View {
        TextField("", text: $otp)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .font(.title)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .inset(by: 0.5)
                    .fill(otp.isEmpty ? Color.secondary : Color.accentColor).opacity(0.2)
            )
            .overlay(
                Circle()
                    .stroke((otp.isEmpty ? Color.secondary : Color.accentColor).opacity(0.5), lineWidth: 1)
            )
    }
}
