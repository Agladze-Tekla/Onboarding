//
//  UIKitNavigationController.swift
//  OnboardingNew
//
//  Created by IT Academy - 5  on 12.01.24.
//

import SwiftUI
import UIKit

enum NavigationPage {
    case loginPage
    case signupPage
    case successPage
    case mainView
}

struct UIKitNavigationController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UINavigationController {
        let rootView = OnboardingView(coordinator: context.coordinator)//LoginView(coordinator: context.coordinator)
        let rootViewController = UIHostingController(rootView: rootView)
        let navigationController = UINavigationController(rootViewController: rootViewController)
        context.coordinator.navigationController = navigationController
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    typealias UIViewControllerType = UINavigationController
    
    //MARK: - Coordinator
    class Coordinator {
        var navigationController: UINavigationController?
        
        func navigate(to page: NavigationPage) {
            var viewController: UIViewController
            switch page {
            case .loginPage:
                viewController = UIHostingController(rootView: LoginView(coordinator: self))
            case .signupPage:
                viewController = UIHostingController(rootView: SignUpView())//(coordinator: self))
            case .successPage:
                viewController = UIHostingController(rootView: SuccessView())//(coordinator: self))
            case .mainView:
                viewController = UIHostingController(rootView: ContentView())//(coordinator: self))
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
