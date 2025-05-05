//
//  Sign in view.swift
//  finentialv1
//
//  Created by Bryan Trieu on 2025-03-31.
//Figma 3

import SwiftUI

struct SignInView: View {
    @State private var userID = ""
    @State private var password = ""

    var body: some View {  // ✅ Keep only this body property
        NavigationStack {
            VStack {
                Text("Sign In")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)

                TextField("User ID", text: $userID)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button(action: {
                    print("Sign In button tapped")
                }) {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top, 20)

                Spacer()

                NavigationLink(destination: SignUpView()) {
                    Text("Create an Account!")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                .padding(.bottom, 20)
            }
            .padding()
        }
    }
}
//Preview
struct SignInViewPreviews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
