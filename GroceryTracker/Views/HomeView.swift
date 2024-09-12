//
//  HomeView.swift
//  GroceryTracker
//
//  Created by Hitesh Rupani on 12/09/24.
//

import SwiftUI

struct HomeView: View {
    @State private var monthlyBudget: Double = 39.0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
//                    HeaderView()
                    
                    PromoView()
                    
                    BudgetView(budget: $monthlyBudget)
                    
                    ExpiringSoonView()
                    
                    UpcomingExpiryView()
                }
                .padding()
                .background(Color(.systemGroupedBackground))
            }
            .navigationBarItems(leading: HeaderView())
            .navigationBarItems(trailing: SubscribeButton())
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "leaf.circle.fill")
                .foregroundColor(.green)
            Text("Grocery tracker")
                .font(.headline)
            Spacer()
        }
    }
}

struct SubscribeButton: View {
    var body: some View {
        Button(action: {
            // Subscription action
        }) {
            Text("\(Image(systemName: "crown"))Subscribe")
                .padding(.horizontal, 15)
                .padding(.vertical, 5)
                .font(.caption)
                .foregroundStyle(Color.white)
                .background(
                    LinearGradient(colors: [Color.mint, .accentColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(Capsule())
        }
    }
}

struct PromoView: View {
    var body: some View {
        HStack {
            Image(systemName: "flame.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
                .padding(.horizontal)
                .background(
                    Circle()
                        .fill(Color.yellow)
                        .frame(width: 150, height: 150)
                )
            
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Just for you!")
                    .font(.headline)
                Text("Claim your exclusive offer today!")
                    .font(.caption)
            }
            .foregroundStyle(Color.white)
            .padding(.trailing)
        }
        .padding()
        .padding(.vertical, 5)
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct BudgetView: View {
    @Binding var budget: Double
    
    var body: some View {
        HStack {
            Image(systemName: "cart.fill")
                .foregroundColor(.accentColor)
                .padding(15)
                .background(
                    Circle()
                        .fill(Color.white)
                )
            
            VStack(alignment: .leading) {
                Text("€\(Int(budget))")
                    .font(.headline)
                Text("Your monthly budget")
                    .font(.caption)
            }
            .foregroundStyle(Color.white)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(Color.white)
                .padding(10)
                .background(
                    Circle()
                        .fill(Color.white.opacity(0.2))
                )
        }
        .padding()
        .background(Color.accentColor)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct ExpiringSoonView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Expiring Soon")
                .font(.headline)
            
            VStack(alignment: .center, spacing: 10) {
                HStack {
                    Text("Total Products")
                    Text("0")
                        .padding(5)
                        .background(
                            Circle()
                                .stroke(Color.secondary.opacity(0.5), lineWidth: 1)
                        )
                    
                    Spacer()
                    
                    Text("View all")
                        .foregroundColor(.accentColor)
                }
                .font(.headline)
                
                Text("Let's fill your cart with Grocery tracker and Make your life easy! 🌿🛒")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button(action: {
                    // Add products action
                }) {
                    Text("Add products")
                        .font(.subheadline)
                        .bold()
                        .padding(.horizontal, 75)
                        .padding(.vertical, 7)
                        .foregroundStyle(Color.accentColor)
                        .background(
                            Capsule()
                                .stroke(Color.secondary.opacity(0.5), lineWidth: 1)
                        )
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct UpcomingExpiryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Upcoming Expiry products")
                .font(.headline)
            
            HStack {
                Text("Total Products")
                Spacer()
                Text("0")
                    .padding(5)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Text("View all")
                    .foregroundColor(.green)
            }
            
            Image(systemName: "cart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .foregroundColor(.gray)
            
            Text("Your cart is empty")
                .font(.headline)
            
            Text("Let's fill your cart with Grocery tracker and Make your life easy! 🌿🛒")
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(10)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
