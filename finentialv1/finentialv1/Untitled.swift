//  TripCardView.swift
//  finentialv1
//
//  Created by Bryan Trieu on 2025-03-31.
//

import SwiftUI

struct TripCardView: View {
    var title: String
    var subtitle: String
    var imageName: String

    var body: some View {
        ZStack {
            // Outer Blue Card
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.teal)
                .frame(height: 250)
                .shadow(radius: 8)

            VStack(spacing: 0) {
                Spacer().frame(height: 20)

                // Subtitle (e.g., South_Korea_Trip)
                Text("South_Korea_Trip")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)

                // Inner Orange Card
                VStack(spacing: 10) {
                    Text("♡ \("My_Japan_ Trip") ♡")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Image("photo_of_japan")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .padding(.horizontal)
                }
                .background(Color.orange)
                .cornerRadius(20)
                .padding(.horizontal, 20)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    TripCardView(

    )
}


