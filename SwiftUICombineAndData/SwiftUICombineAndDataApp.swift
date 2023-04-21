//
//  SwiftUICombineAndDataApp.swift
//  SwiftUICombineAndData
//
//  Created by Daniel Yeboah on 20.4.2023.
//

import SwiftUI
import Firebase

@main
struct SwiftUICombineAndDataApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
       return true
    }
}
