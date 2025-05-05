//
//  CreateExpenseView.swift
//  finentialv1
//
//  Created by Leo Suen on 2025-03-31.
// Figma 6

import SwiftUI

struct ExpensesView: View {
    let expenses = [
        ("Hotel", "Details about hotel expenses..."),
        ("Ichiran Ramen", "Jill: $40\nJane: $60\nMartin: $70\nGreg: $30\nTip: $30\nTotal: $230"),
        ("Gyukaku", "Details about Gyukaku expenses...")
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Top navigation buttons
                HStack {
                    Button(action: {
                        // Back button action
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .padding(.horizontal, 30)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Menu button action
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title2)
                            .padding(.horizontal, 30)
                    }
                }
                
                // View Expenses title
                Text("View Expenses")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, -10) // Slight adjustment to move it up a bit
                
                Spacer()
                    .frame(height: 10)
                
                // Create New Expense Button
                Button(action: {
                    // Create expense action
                }) {
                    Text("Create a new expense")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.darkBlue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 30) // <-- ADDED padding 30 here
                
                Spacer()
                    .frame(height: 20)
                
                // Layered Expense Cards
                ZStack {
                    ForEach(expenses.indices.reversed(), id: \.self) { index in
                        ExpenseCard(
                            title: expenses[index].0,
                            details: expenses[index].1,
                            backgroundColor: randomColor(index: index)
                        )
                        .offset(y: CGFloat(index) * -60)
                        .scaleEffect(1 - CGFloat(index) * 0.03)
                        .opacity(1 - CGFloat(index) * 0.1)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 100)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
    
    // Deterministic random colors based on index
    func randomColor(index: Int) -> Color {
        let colors: [Color] = [
            Color.azure.opacity(1),
            Color.gray.opacity(0.8),
            Color.orange.opacity(0.8),
            Color.green.opacity(0.8),
            Color.yellow.opacity(0.8)
        ]
        return colors[index % colors.count]
    }
}

// ExpenseCard View
struct ExpenseCard: View {
    var title: String
    var details: String
    var backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
            
            Text(details)
                .font(.subheadline)
                .padding(.bottom, 10)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 350)
        .background(backgroundColor)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

// Preview
struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}

#Preview {
    ExpensesView()
}
