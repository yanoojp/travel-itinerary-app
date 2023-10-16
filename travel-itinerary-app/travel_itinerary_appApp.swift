//
//  travel_itinerary_appApp.swift
//  travel-itinerary-app
//
//  Created by ysnoojp on 2023/10/13.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
//import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
      
@main
struct travel_itinerary_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
