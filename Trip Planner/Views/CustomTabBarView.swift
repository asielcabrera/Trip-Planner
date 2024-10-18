//
//  CustomTabBarView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

struct CustomTabBarView: View {
    var body: some View {
        TabView {
            TripsView()
                .tabItem {
                    Label("Trips", systemImage: "car")
                }
            
            WorkersView()
                .tabItem {
                    Label("Workers", systemImage: "person.3")
                }

            AssistanceView()
                .tabItem {
                    Label("Assistance", systemImage: "person.2")
                }
            
            PassangerView()
                .tabItem {
                    Label("Passengers", systemImage: "person.2")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }

            SettingsView() // Asegúrate de que esta vista esté aquí
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
