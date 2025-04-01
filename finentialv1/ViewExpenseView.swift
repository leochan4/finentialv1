//
//  CreateExpenseView.swift
//  finentialv1
//
//  Created by Leo Suen on 2025-03-31.
//

import SwiftUI

struct ViewExpensesView: View {
    let expenses: [Expense] = [
        Expense(title: "Hotel", details: ""),
        Expense(title: "Ichiran Ramen", details: "Jill: $40\nJane: $60\nMartin: $70\nGreg: $30\n\nAdd a Tip (15%):\nTip: $200 × 0.15 = $30\nTotal with tip: $230\n\nJill’s Tip:\nJill’s proportion of the bill: $40 / $200 = 0.2\nJill’s tip share: 0.2 × $30 = $6\n\nJane’s Tip:\nJane’s proportion of the bill: $60 / $200 = 0.3\nJane’s tip share: 0.3 × $30 = $9"),
        Expense(title: "Gyukaku", details: "")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { /* Back action */ }) {
                    Image(systemName: "chevron.left")
                        .padding()
                }
                Spacer()
                Text("View Expenses")
                    .font(.title3)
                    .bold()
                Spacer()
                Button(action: { /* Help or Guide action */ }) {
                    Image(systemName: "book.fill")
                        .padding()
                }
            }
            .padding(.horizontal)
            
            Button(action: { /* Add new expense action */ }) {
                Text("Create a new expense")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            ScrollView {
                VStack(spacing: -20) { // Negative spacing for overlap effect
                    ForEach(expenses.indices, id: \..self) { index in
                        ExpenseCard(expense: expenses[index], isHighlighted: index == 1)
                            .zIndex(Double(expenses.count - index))
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .padding()
    }
}

struct Expense: Identifiable {
    let id = UUID()
    let title: String
    let details: String
}

struct ExpenseCard: View {
    let expense: Expense
    let isHighlighted: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(expense.title)
                .font(.headline)
                .bold()
                .padding(.top, 10)
            if !expense.details.isEmpty {
                Text(expense.details)
                    .font(.body)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(isHighlighted ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0, y: 5)
    }
}

struct ViewExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ViewExpensesView()
    }
}


#Preview {
    ViewExpensesView()
}
