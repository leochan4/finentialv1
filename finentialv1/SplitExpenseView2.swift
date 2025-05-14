//
//  SplitExpenseView2.swift
//  finentialv1
//
//  Created by Leo Suen on 2025-05-13.
// figma 27

import SwiftUI

struct SplitExpenseView2: View {
    let expenseDate = "12-12-2024"
    let restaurant = "Gyukaku"
    
    let items: [ExpenseItem2] = [
        .init(name: "meat", quantity: 1, cost: 91.00, assigned: ["A", "B", "C", "D", "E", "F", "G"], startExpanded: true),
        .init(name: "salad", quantity: 1, cost: 4.20, assigned: ["L"]),
        .init(name: "pepsi", quantity: 3, cost: 3.00, assigned: ["B", "J"]),
        .init(name: "soju", quantity: 2, cost: 15.00, assigned: ["B"]),
        .init(name: "takoyaki", quantity: 1, cost: 8.00, assigned: ["ALL"]),
        .init(name: "icecream", quantity: 2, cost: 6.99, assigned: [])
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            // Top bar
            HStack {
                Button(action: {
                    // Back action
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                }
                
                Spacer()
                
                Text("Split Expenses")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    // Chart or menu button
                }) {
                    Image(systemName: "chart.bar.fill")
                        .font(.title2)
                        .padding()
                }
            }
            
            // Title
            VStack(spacing: 2) {
                Text(restaurant)
                    .font(.title3)
                    .bold()
                Text("[\(expenseDate)]")
                    .font(.subheadline)
            }
            .padding(.vertical, 8)
            
            // List Header
            HStack {
                Text("Items").bold().frame(maxWidth: .infinity, alignment: .leading)
                Text("Totals").bold().frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
            
            // Items List
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(items) { item in
                        ItemRowView2(item: item)
                    }
                }
                .padding(.horizontal)
            }
            
            // Selection Button Group (at bottom)
            HStack(spacing: 10) {
                CircleLabel(text: "B", color: .red)
                CircleLabel(text: "J", color: .purple)
                CircleLabel(text: "L", color: .yellow)
            }
            .padding(.top)
            
            // Calculate Button
            Button(action: {
                // Calculate logic
            }) {
                Text("Calculate")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("DarkBlue").opacity(0.85))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .background(Color("Azure").opacity(0.6).edgesIgnoringSafeArea(.all))
    }
}

struct ExpenseItem2: Identifiable {
    let id = UUID()
    var name: String
    var quantity: Int
    var cost: Double
    var assigned: [String] // Example: ["B", "J"]
    var startExpanded: Bool = false
}

struct ItemRowView2: View {
    var item: ExpenseItem2
    @State private var isExpanded: Bool
    
    init(item: ExpenseItem2){
        self.item = item
        _isExpanded = State(initialValue: item.startExpanded)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(item.name)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("\(item.quantity) x $\(String(format: "%.2f", item.cost)) CAD")
                    .font(.subheadline)
            }
            
            // Expandable Box containing circle icons
            HStack {
                HStack(spacing: 8) {
                    ForEach(displayedAssigned, id: \.self) { label in
                        CircleLabel2(text: label)
                    }

                    if !isExpanded && item.assigned.count > 2 {
                        Text("...")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }

                Spacer()

                // Expand/Collapse Button
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.subheadline)
                        .padding(6)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 1)
                }
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            
            Divider()
        }
    }
    
    // Only show first 2 if collapsed
    private var displayedAssigned: [String] {
        isExpanded ? item.assigned : Array(item.assigned.prefix(2))
    }
}

struct CircleLabel2: View {
    var text: String
    var color: Color = .gray
    
    init(text: String, color: Color? = nil) {
        self.text = text
        if let color = color {
            self.color = color
        } else {
            self.color = Self.colorForInitial(text)
        }
    }
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 24, height: 24)
            .background(color)
            .clipShape(Circle())
    }
    
    static func colorForInitial(_ initial: String) -> Color {
        switch initial {
        case "B": return .red
        case "J": return .purple
        case "L": return .yellow
        default: return .gray
        }
    }
}

// Preview
struct SplitExpenseView2_Previews: PreviewProvider {
    static var previews: some View {
        SplitExpenseView2()
    }
}

#Preview {
    SplitExpenseView2()
}

