//
//  TextFieldView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var isTextVisible: Bool
    var isPassword: Bool = false
    var placeholder: String
    @Binding var text: String

    var body: some View {
        if isPassword && isTextVisible {
            TextField(placeholder, text: $text)
                .padding()
                .background (
                    Capsule()
                        .stroke(Color.secondary, lineWidth: 1)
                )
                .frame(width: UIScreen.main.bounds.width /  1.25, height: 50)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: isTextVisible ? "eye.slash.fill" : "eye.fill")
                            .padding()
                            .foregroundStyle(Color.secondary)
                            .onTapGesture {
                                isTextVisible.toggle()
                            }
                    }
                )
            
        } else if isPassword && !isTextVisible{
            SecureField(placeholder, text: $text)
                .padding()
                .background(
                    Capsule()
                        .stroke(Color.secondary, lineWidth: 1)
                )
                .frame(width: UIScreen.main.bounds.width / 1.25, height: 50)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: isTextVisible ? "eye.slash.fill" : "eye.fill")
                            .padding()
                            .foregroundStyle(Color.secondary)
                            .onTapGesture {
                                isTextVisible.toggle()
                            }
                    }
                )
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .background (
                    Capsule()
                        .stroke(Color.secondary, lineWidth: 1)
                )
                .frame(width: UIScreen.main.bounds.width /  1.25, height: 50)
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(isTextVisible: .constant(true), isPassword: true, placeholder: "Enter password", text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
