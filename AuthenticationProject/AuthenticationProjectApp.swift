//
//  AuthenticationProjectApp.swift
//  AuthenticationProject
//
//  Created by Thiago Lourenço on 12/03/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct AuthenticationProjectApp: App {
    @AppStorage("isSign") private var isSign: Bool = false

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            
            if isSign {
                HomeView()
            } else {
                SignInView()
            }
        
        }
    }
}
