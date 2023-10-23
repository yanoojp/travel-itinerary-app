//
//  SignupView.swift
//  travel-itinerary-app
//
//  Created by ysnoojp on 2023/10/14.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State var email: String = ""
    @State private var password: String = ""
    @State private var navigateToHome = false
    @State private var showingError = false
    @State private var errorString = ""
    @State private var navigateToLogin = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)

            Button("Signup") {
                Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
                    if let error = error {
                        self.errorString = error.localizedDescription
                        self.showingError = true
                    } else {
                        self.navigateToHome = true
                    }
                }
            }
            .alert(isPresented: $showingError) {
                Alert(title: Text("Error"), message: Text(self.errorString), dismissButton: .default(Text("ok")))
            }
            .fullScreenCover(isPresented: $navigateToHome, content: {
                HomeView()
            })
            .padding()
            
            Button("Already have an account? Login") {
                self.navigateToLogin = true
            }
            .fullScreenCover(isPresented: $navigateToLogin, content: {
                LoginView()
            })
        }
        .padding()
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
