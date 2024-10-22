//
//  Trip_PlannerApp.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

@main
struct Trip_PlannerApp: App {
    
    @Environment(\.authenticationContext) var authenticationContext
    @Environment(\.onBoardingContext) var onBoardingContext
    var body: some Scene {
        WindowGroup {
            
            if onBoardingContext.isOnboardingComplete {
                if authenticationContext.isLoggedIn {
                    ContentView() // Redirige al HomeView si está autenticado
                } else {
                    LoginView() // Muestra el LoginView si no está autenticado
                }
            } else {
                OnboardingView()
            }
        }
    }
}
