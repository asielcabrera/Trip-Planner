//
//  OnBoardingContext.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//


import SwiftUI

@Observable
public final class OnBoardingContext {
    
    public var isOnboardingComplete: Bool {
        get {
            UserDefaults.standard.bool(forKey: "isOnboardingComplete")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isOnboardingComplete")
        }
    }
    
    func resetOnboardingComplete() {
        isOnboardingComplete = false
    }
    
    func completeOnboarding() {
        isOnboardingComplete = true
    }
}
