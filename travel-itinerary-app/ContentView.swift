//
//  ContentView.swift
//  travel-itinerary-app
//
//  Created by ysnoojp on 2023/10/13.
//

import SwiftUI

struct Travel_Itenerary_appApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
