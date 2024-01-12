//
//  Version2.swift
//  OnboardingNew
//
//  Created by IT Academy - 5  on 12.01.24.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
    @AppStorage("onboarding_viewed") var onboardingViewed: Bool = false
    var coordinator: UIKitNavigationController.Coordinator
    @StateObject var viewModel: OnboardingViewModel
    
    // MARK: - Init
    init(coordinator: UIKitNavigationController.Coordinator) {
        self.coordinator = coordinator
        self._viewModel = StateObject(wrappedValue: OnboardingViewModel(coordinator: coordinator))
    }
//    @State private var currentPage = 0
//    private let pages = [0]
    
    //MARK: - Body
    var body: some View {
        ZStack {
            if onboardingViewed {
                //TODO: NAVIGATE TO LOGIN
                Text("Profile View")
                    .onTapGesture {
                        onboardingViewed = false
                    }
            } else {
                onboardingTabs
                    .background(Color.customBackgroundColor).ignoresSafeArea()
            }
        }
    }
    
    //MARK: - Contents
    private var onboardingTabs: some View {
        VStack {
            TabView {
                welcomeView
                storageBenefitsView
                easyManagmentView
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
    
    //MARK: - Oboarding Tab Views
    private var welcomeView: some View {
        VStack(spacing: 50) {
            skipButton
            Image.onboardingFirstScreenImage
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            TitleText(text: "Welcome to iGuard")
            Spacer()
            nextButton
        }
        .padding(30)
    }
    
    private var storageBenefitsView: some View {
        VStack(spacing: 50) {
            skipButton
            Image.onboardingSecondScreenImage
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            TitleText(text: "Storage Benefits")
            VStack(alignment: .leading, spacing: 25){
                OnboardingDescriptionTextView(text: "Encrypt and secure your IBans")
                OnboardingDescriptionTextView(text: "Effortlessly orginize your banking details")
                OnboardingDescriptionTextView(text: "Bank securly with advanced features")
            }
            Spacer()
            nextButton
        }
        .padding(30)
    }
    
    private var easyManagmentView: some View {
        VStack(spacing: 50) {
            //TODO: MAKE IMAGE REUSABLE
            Image.onboardingThirdScreenImage
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
            TitleText(text: "Easy Managment")
            VStack(alignment: .leading, spacing: 25){
                OnboardingDescriptionTextView(text: "Seamless control of your IBans")
                OnboardingDescriptionTextView(text: "Effortlesly handle your banking data")
                OnboardingDescriptionTextView(text: "Simplified IBan organization for you")
            }
            Spacer()
            getStartedButton
        }
        .padding(30)
    }
    
    //MARK: - Buttons
    private var skipButton: some View {
        //TODO: MAKE SKIP BUTTON AITHACTIONBUTTONVIEW
        //TODO: ON TAP NAVIGATE TO LOGIN
        HStack{
            Spacer()
            Button(action: {
                coordinator.navigate(to: .loginPage)
                //viewModel.navigateToLogin()
            }) {
                Text("Skip")
                    .foregroundColor(.gray)
                    .underline()
            }
        }
    }
    
    private var nextButton: some View {
        PrimaryButtonComponentView(text: "Next")
    }
    
    private var getStartedButton: some View {
        AuthActionButtonView(actionText: "Get Started") {
//            onboardingViewed = true
            //TODO: ADD ONTAP ACTION
            viewModel.navigateToLogin()
        }
    }
    
    //MARK: - Structs
    struct TitleText: View {
        var text: String
        
        var body: some View {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
    
    struct OnboardingDescriptionTextView: View {
        var text: String
        
        var body: some View {
            HStack {
                Checkmark()
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
            }
        }
    }
    
    struct Checkmark: View {
        var body: some View {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(.customAccentColor)
        }
    }
}

//MARK: - Preview
//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView(coordinator: OnboardingViewModel(coordinator: UIKitNavigationController.Coordinator()))
//            .background(Color.customBackgroundColor).ignoresSafeArea()
//    }
//}
