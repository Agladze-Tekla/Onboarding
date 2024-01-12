//
//  LoginView.swift
//  OnboardingNew
//
//  Created by IT Academy - 5  on 12.01.24.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    var coordinator: UIKitNavigationController.Coordinator
    
    // MARK: - Init
    init(coordinator: UIKitNavigationController.Coordinator) {
        self.coordinator = coordinator
    }
    var body: some View {
        Text("LoginView")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(coordinator: UIKitNavigationController.Coordinator())
    }
}
