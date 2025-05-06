//
//  ContentView.swift
//  finentialv1
//
//  Created by Leo Suen on 2025-03-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ZStack(alignment: .topLeading) {
                
                Image("finentiallanding")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 500)
                    .clipped()
                    .clipShape(RoundedCorner(radius: 50, corners: [.bottomLeft, .bottomRight]))
                
                VStack(alignment: .leading) {
                    Text("Finential")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 60)
                        .padding(.leading, 60)
                    
                    Spacer()
                    
                    Text("ready to GO?")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                        .padding(.leading, 60)
                    
                }
                .frame(height: 500, alignment: .bottomLeading)
            }
            
            Spacer()
            
            VStack(spacing: 16){
                Text("Have an Account?")
                    .foregroundColor(.white.opacity(0.7))
                
                Button(action: {
                    //sign in action
                }) {
                    Text("Sign in")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                }
                .padding(.horizontal, 40)
                
                Button(action: {
                    //create account
                }) {
                    Text("Create an Account")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
                .padding(.top, 5)
                
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 30)
            .padding(.bottom, 40)
            .background(Color("DarkBlue"))
            .clipShape(RoundedCorner(radius: 30, corners: [.topLeft, .topRight]))
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color("DarkBlue").edgesIgnoringSafeArea(.all))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    ContentView()}
