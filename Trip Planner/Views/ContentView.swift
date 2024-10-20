//
//  HomeView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showMenu: Bool = false
    @State private var selectedAction: SideBarAction = .trips
    var body: some View {
        AnimateSideBar(showMenu: $showMenu) { safeArea in
            switch selectedAction {
            case .trips:
                TripsView(showMenu: $showMenu)
            case .workers:
                WorkersView(showMenu: $showMenu)
            case .settings:
                SettingsView(showMenu: $showMenu)
            case .assistence:
                AssistanceView()
            case .passangers:
                PassangerView(showMenu: $showMenu)
            case .logout:
                ProfileView()
            }
        } menuView: { safeArea in
            SideBarMenu(safeArea: safeArea, selectedAction: $selectedAction)
        } background: {
            Rectangle()
                .fill(.tripPlannerBackground)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Trip.self])
}
