//
//  roomie2App.swift
//  roomie2
//
//  Created by Administrator on 8/6/24.
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
struct roomie2App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var user = User()
    @StateObject var viewModel = AuthViewModel()
    @StateObject var house = House(name: "No name yet", createdBy: User(), createdAt: Date())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel) //added
                .environmentObject(house)
                .environmentObject(user)

        }
    }
}
