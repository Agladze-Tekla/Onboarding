//
//  OnboardingViewModel.swift
//  OnboardingNew
//
//  Created by IT Academy - 5  on 12.01.24.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    //MARK: - Properties
    var coordinator = UIKitNavigationController.Coordinator()
    
    // MARK: - Init
    init(coordinator: UIKitNavigationController.Coordinator) {
        self.coordinator = coordinator
    }
    
    func navigateToLogin() {
        coordinator.navigate(to: .loginPage)
    }
    
}
