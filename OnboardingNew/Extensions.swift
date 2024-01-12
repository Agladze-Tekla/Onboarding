//
//  ColorExtension.swift
//  OnboardingNew
//
//  Created by Tekla on 1/11/24.
//

import SwiftUI

extension Color {
    static let customBackgroundColor = Color(red: 21/255, green: 21/255, blue: 23/255)
    static let customAccentColor = Color(red: 101/255, green: 82/255, blue: 254/255)
    static let customTextFieldColor = Color(red: 22/255, green: 22/255, blue: 30/255)
    static let customListRowBackgroundColor = Color(red: 33/255, green: 33/255, blue: 36/255)
    static let customScanButtonBackgroundColor = Color(red: 21/255, green: 21/255, blue: 23/255)
}

extension Image {
    static let logoIcon = Image("logo")
    static let logoWithTitle = Image("logoWithTitle")
    static let onboardingFirstScreenImage = Image("onboarding1")
    static let onboardingSecondScreenImage = Image("onboarding2")
    static let onboardingThirdScreenImage = Image("onboarding3")
    static let emptyStateImage = Image("emptyState")
    static let confetti = Image("confetti")
}

struct PrimaryButtonComponentView: View {
    // MARK: - Properties
    var text: String
    
    // MARK: - Body
    var body: some View {
            Text(text.capitalized)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(Color.customAccentColor)
                .cornerRadius(12)
                .padding(.horizontal, 16)
        }
    }

import SwiftUI

struct AuthActionButtonView: View {
    //MARK: - Properties
    var actionText: String
    var isEnabled: Bool?
    var onTap: () async -> Void
    var onNavigate: (() -> Void)?
    
    //MARK: - Body
    var body: some View {
        Button(action: {
            Task {
                await onTap()
                onNavigate?()
            }
        }) {
            PrimaryButtonComponentView(text: actionText)
                .opacity(isEnabled ?? true ? 1.0 : 0.3)
                .disabled(isEnabled == false)
        }
    }
}

