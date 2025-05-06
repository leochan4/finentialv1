//
//  TripCardView.swift
//  finentialv1
//
//  Created by Bryan Trieu on 2025-04-27.
//

import SwiftUI

struct TabsPageView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Top Bar
                HStack {
                    Button(action: {
                        // Handle back action
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(.darkGray))
                            .clipShape(Circle())
                    }

                    Spacer()

                    Text("Tabs")
                        .font(.title)
                        .fontWeight(.semibold)

                    Spacer()

                    Button(action: {
                        // Handle map action
                    }) {
                        Image(systemName: "map")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(.darkGray))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)

                // Split your bills and plus button
                HStack {
                    Text("Split your bills easily")
                        .foregroundColor(.gray)

                    Spacer()

                    Button(action: {
                        // Add a new trip (future feature)
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color(.gray))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)

                // Big Plus Button
                Button(action: {
                    // Handle creating new Trip
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .padding(.horizontal)

                // Trip Card View
                ScrollView {
                    VStack(spacing: 20) {
                        TripCardView()
                        // Add more TripCardViews here if needed
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct TripCardView: View {
    var body: some View {
        ZStack {
            // Outer Blue Card
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.teal)
                .frame(height: 250)
                .shadow(radius: 8)

            VStack(spacing: 0) {
                Spacer().frame(height: 20)

                // Subtitle (South Korea Trip)
                Text("North Korea")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)

                // Inner Orange Card
                VStack(spacing: 10) {
                    Text("♡ My Japan Trip ♡")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Image("photo of japan") // Make sure 'kyoto' is in Assets
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
    TabsPageView()
}
