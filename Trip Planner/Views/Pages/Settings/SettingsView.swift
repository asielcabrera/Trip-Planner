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

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    // Interruptor para Modo Claro/Oscuro
                    Toggle("Dark Mode", isOn: $isDarkMode)
                        .onChange(of: isDarkMode) { value in
                            // Implementar cualquier acción que quieras hacer cuando el modo cambie
                        }
                    
                    // Selector de Temas
                    Picker("Theme", selection: $selectedTheme) {
                        Text("Default").tag("Default")
                        Text("Blue").tag("Blue")
                        Text("Green").tag("Green")
                        Text("Red").tag("Red")
                    }
                }
                
                Section(header: Text("Other Settings")) {
                    // Puedes agregar más configuraciones aquí
                    Toggle("Notifications", isOn: .constant(true)) // Placeholder para futuras configuraciones
                    Toggle("Location Services", isOn: .constant(false))
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light) // Aplicar el modo seleccionado
    }
}

