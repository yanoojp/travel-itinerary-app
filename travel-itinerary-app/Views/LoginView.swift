//
//  LoginView.swift
//  travel-itinerary-app
//
//  Created by ysnoojp on 2023/10/14.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToHome = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button("Login") {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in  if let error = error {
                    print("Error logging in: \(error.localizedDescription)")

                } else {
                    self.navigateToHome = true
                }}
            }
            .fullScreenCover(isPresented: $navigateToHome, content: {
                HomeView()
            })
            
            NavigationLink(destination: SignupView()) {
                Text("Don't have an account? Sign Up")
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
