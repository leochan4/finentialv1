//
//  View Expenses 4A.swift
//  finentialv1
//
//  Created by Bryan Trieu on 2025-04-30.
//

import SwiftUI

struct ViewExpensePage: View {
    @State private var selectedCategory = "Ichiran"
    let categories = ["Hotel", "Ichiran", "Gyukaku"]

    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                // Top bar
                HStack {
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(.darkGray))
                            .clipShape(Circle())
                    }

                    Spacer()

                    Text("View Expense")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Spacer()

                    Button(action: {}) {
                        Image(systemName: "map")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(.darkGray))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)

                // Expense Cards
                VStack(spacing: 12) {
                    ExpenseTab(name: "BRYAN", amount: 1300.00, payees: ["F", "W", "X", "L"])
                    ExpenseTab(name: "Joseph", amount: 600.00, payees: ["W", "L"])
                }

                // Create a new expense button
                Button(action: {}) {
                    Text("Create a new expense")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.darkGray))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                // Simulate keyboard space with a dummy TextField
                TextField("Type something...", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                // Category Selector
                VStack(spacing: 0) {
                    ForEach(categories, id: \.self) { category in
                        HStack {
                            Image(systemName: category == "Gyukaku" ? "heart" : "")
                                .opacity(category == "Gyukaku" ? 1 : 0)
                            Text(category)
                                .fontWeight(selectedCategory == category ? .bold : .regular)
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            selectedCategory == category
                            ? Color.blue.opacity(0.2)
                            : Color.gray.opacity(0.1)
                        )
                        .cornerRadius(15)
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}
