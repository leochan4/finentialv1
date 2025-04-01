//
//  TabCreateView.swift
//  finentialv1
//
//  Created by Leo Suen on 2025-03-30.
//

import SwiftUI

struct TabCreateView: View {
    @State private var tabName: String = ""
    @State private var members: [String] = ["JILL", "Jane"]
    @State private var newMember: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { /* Back action */ }) {
                    Image(systemName: "chevron.left")
                        .padding()
                }
                Spacer()
                Text("Create a New Tab")
                    .font(.title3)
                    .bold()
                Spacer()
                Button(action: { /* Help or Guide action */ }) {
                    Image(systemName: "book.fill")
                        .padding()
                }
            }
            .padding(.horizontal)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("Azure"))
                    .shadow(color: .gray, radius: 5, x: 0, y: 5) // Shadow behind the blue area
                
                VStack(alignment: .leading) {
                    Text("[Tab Name]")
                        .font(.headline)
                        .padding(.top)
                    TextField("Enter tab name", text: $tabName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    
                    Text("Who’s in the group?")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    ForEach(members, id: \..self) { member in
                        TextField("", text: .constant(member))
                            .textFieldStyle(PlainTextFieldStyle())
                            .disabled(true)
                    }
                    
                    HStack {
                        TextField("Add member", text: $newMember)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                            if !newMember.isEmpty {
                                members.append(newMember)
                                newMember = ""
                            }
                        }) {
                            Text("Add New")
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.top, 5)
                }
                .padding()
            }
            .padding()
            
            Spacer()
            
            VStack(spacing: 15) {
                Button(action: { /* Enter expense manually */ }) {
                    Text("Enter Expense Manually")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: { /* Take a receipt photo */ }) {
                    Text("Take a Receipt Photo")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: { /* View expenses */ }) {
                    Text("View Expenses")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    TabCreateView()
}
