//
//  SettingsView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false // Usar AppStorage para guardar el estado
    @State private var selectedTheme: String = "Default"
    @Binding var showMenu: Bool
    var body: some View {
        BaseLayoutView(tittle: "Settings",
                       showPlusButtonAction: false,
                       showTittleView: true,
                       showMenu: $showMenu) {
            VStack {
                VStack(alignment: .leading) {
                    Text("Appearance")
                        .font(.system(size: 25))
                        .foregroundStyle(.tripPlannerBackground.opacity(0.9))
                    VStack {
                        Toggle("Dark Mode", isOn: $isDarkMode)
                            .font(.system(size: 15))
                            .foregroundStyle(.tripPlannerBackground.opacity(0.9))
                        
                        HStack {
                            Text("Theme")
                                .font(.system(size: 15))
                                .foregroundStyle(.tripPlannerBackground.opacity(0.9))
                            Spacer(minLength: 0)
                            Picker("Theme", selection: $selectedTheme) {
                                Text("Default").tag("Default")
                                Text("Blue").tag("Blue")
                                Text("Green").tag("Green")
                                Text("Red").tag("Red")
                            }
                            .font(.system(size: 15))
                            .foregroundStyle(.tripPlannerBackground)
                        }
                    }.padding(.leading, 15)
                }
                
                VStack(alignment: .leading) {
                    Text("Other Settings")
                        .font(.system(size: 25))
                        .foregroundStyle(.tripPlannerBackground.opacity(0.9))
                    // Puedes agregar más configuraciones aquí
                    VStack {
                        Toggle("Notifications", isOn: .constant(true)) // Placeholder para futuras configuraciones
                            .font(.system(size: 15))
                            .foregroundStyle(.tripPlannerBackground.opacity(0.9))
                        Toggle("Location Services", isOn: .constant(false))
                            .font(.system(size: 15))
                            .foregroundStyle(.tripPlannerBackground.opacity(0.9))
                    }
                    .padding(.leading, 15)
                }
                Spacer(minLength: 0)
            }
            .padding(.top, 10)
            .padding(.horizontal)
        }
                       .preferredColorScheme(isDarkMode ? .dark : .light) // Aplicar el modo seleccionado
    }
}

