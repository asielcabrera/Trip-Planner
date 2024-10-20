//
//  HomeView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var selectedTab = 0
    @State private var showMenu: Bool = false
    var body: some View {
        
        AnimateSideBar(showMenu: $showMenu) { safeArea in
            TripsView(showMenu: $showMenu)
        } menuView: { safeArea in
            SideBarMenu(safeArea: safeArea)
        } background: {
            Rectangle()
                .fill(.bg)
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: [Trip.self])
}
