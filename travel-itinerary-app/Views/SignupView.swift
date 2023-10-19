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
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button("Signup") {
                Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
                    if let error = error {
                        print("Error signing up: \(error.localizedDescription)")
                    } else {
                        self.navigateToHome = true
                    }
                }
            }
            .fullScreenCover(isPresented: $navigateToHome, content: {
                HomeView()
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
