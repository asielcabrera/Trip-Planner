//
//  Trip_PlannerApp.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI
import SwiftData

@main
struct Trip_PlannerApp: App {
    @Bindable var appViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if appViewModel.isLoggedIn {
                ContentView() // Redirige al HomeView si está autenticado
                    .environmentObject(appViewModel)
            } else {
                LoginView() // Muestra el LoginView si no está autenticado
                    .environmentObject(appViewModel)
            }
        }
        .modelContainer(for: [Trip.self])
    }
}
