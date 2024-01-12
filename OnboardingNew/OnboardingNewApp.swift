//
//  OnboardingNewApp.swift
//  OnboardingNew
//
//  Created by Tekla on 1/11/24.
//

import SwiftUI

@main
struct OnboardingNewApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            UIKitNavigationController()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
}
