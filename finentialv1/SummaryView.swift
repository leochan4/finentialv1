//
//  SummaryView.swift
//  finentialv1
//
//  Created by Leo Suen on 2025-05-13.
// figma 32

import SwiftUI

struct SummaryView: View {
    let restaurant = "Gyukaku"
    let date = "12-12-2024"
    
    // Example summary data (replace with real calculation later)
    let settlements = [
        "B owes J: $15.00",
        "J owes L: $8.20",
        "L owes B: $12.75"
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            
            // Top Navigation Bar
            HStack {
                Button(action: {
                    // Back action
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .padding()
                }
                
                Spacer()
                
                Text("Summary")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    // Menu or chart button
                }) {
                    Image(systemName: "chart.bar.fill")
                        .font(.title2)
                        .padding()
                }
            }
            
            // Title Info
            VStack(spacing: 2) {
                Text(restaurant)
                    .font(.title3)
                    .fontWeight(.bold)
                Text("[\(date)]")
                    .font(.subheadline)
            }
            .padding(.bottom)
            
            // Settlement Summary Box
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(settlements, id: \.self) { line in
                        Text(line)
                            .font(.body)
                            .padding(.horizontal)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
            }
            .padding()
            .background(Color("Azure"))
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.top, 10)
            
            Spacer()
            
            // Share Button
            Button(action: {
                // Share logic
            }) {
                Text("SHARE")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("DarkBlue"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    SummaryView()
}
