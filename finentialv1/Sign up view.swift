//
//  Sign up view.swift
//  finentialv1
//
//  Created by Bryan Trieu on 2025-03-31.
//
//Figma 2
import SwiftUI
struct SignUpView: View {
    @State private var userID = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack {
            Text("Create an Account!")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 20)

            TextField("User ID", text: $userID)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            SecureField("Re-enter Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
                // Handle Sign-Up Action
            }) {
                Text("Sign Up")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Back to Sign In", displayMode: .inline) // Adds a back button automatically
    }
}
#Preview {
    SignUpView()
}
