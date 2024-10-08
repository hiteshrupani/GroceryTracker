//
//  ButtonView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 11/09/24.
//

import SwiftUI

struct ButtonView: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button (action: action){
            Text(text)
                .padding()
                .frame(width: UIScreen.main.bounds.width /  1.2, height: 50)
                .foregroundStyle(Color.white)
                .background(
                    Capsule()
                        .fill(Color.accentColor)
                )
                
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Login", action: {})
            .previewLayout(.sizeThatFits)
    }
}
