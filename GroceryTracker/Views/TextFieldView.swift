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
    var isMultiLine: Bool = false
    var height: CGFloat = 50
    
    var body: some View {
        if isPassword && isTextVisible {
            TextField(placeholder, text: $text)
                .padding()
                .frame(width: UIScreen.main.bounds.width /  1.2, height: height)
                .background (
                    RoundedRectangle(cornerRadius: 27.5, style: .continuous)
                        .inset(by: 0.5)
                        .stroke(Color.secondary, lineWidth: 1)
                )
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
                .frame(width: UIScreen.main.bounds.width /  1.2, height: height)
                .background (
                    RoundedRectangle(cornerRadius: 27.5, style: .continuous)
                        .inset(by: 0.5)
                        .stroke(Color.secondary, lineWidth: 1)
                )
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
        } else if isMultiLine {
            TextEditor(text: $text)
                .padding()
                .frame(width: UIScreen.main.bounds.width /  1.2, height: height)
                .background (
                    RoundedRectangle(cornerRadius: 27.5, style: .continuous)
                        .inset(by: 0.5)
                        .stroke(Color.secondary, lineWidth: 1)
                )
                
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .frame(width: UIScreen.main.bounds.width /  1.2, height: height)
                .background (
                    RoundedRectangle(cornerRadius: 27.5, style: .continuous)
                        .inset(by: 0.5)
                        .stroke(Color.secondary, lineWidth: 1)
                )
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(isTextVisible: .constant(true), isPassword: false, placeholder: "Enter password", text: .constant(""), isMultiLine: false)
            .previewLayout(.sizeThatFits)
    }
}
