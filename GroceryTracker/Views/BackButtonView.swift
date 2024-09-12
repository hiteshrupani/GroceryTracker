//
//  BackButtonView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 12/09/24.
//

import SwiftUI

struct BackButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .foregroundStyle(.background)
                .padding()
                .frame(width: 40, height: 40)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.4))
                )
                .padding(.bottom)
        }
    }
}

#Preview {
    BackButtonView(action: {})
}
