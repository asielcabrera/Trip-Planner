//
//  ProfileView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI
import SwiftData


struct ProfileView: View {
    @State private var firstName: String = "Sergio" // Cambia estos valores según sea necesario
    @State private var lastName: String = "Cabrera"
    @State private var role: Role = .Worker // Asigna el rol correspondiente

    @Binding var showMenu: Bool
    
    @Environment(\.authenticationContext) var authenticationContext
    
    var body: some View {
        BaseLayoutView(
            tittle: "Profile",
            showPlusButtonAction: false,
            showTittleView: false,
            showMenu: $showMenu) {
            VStack {
                // Icono de persona centrado
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.tripPlannerDark)
                    .padding(.top, 50) // Margen superior

                // Nombre y apellido
                Text("\(firstName) \(lastName)")
                    .font(.largeTitle)
                    .padding(.top, 20)
                    .foregroundColor(.tripPlannerDark)

                // Rol del usuario
                HStack {
                    Text("Position:")
                        .font(.headline)
                        .foregroundColor(.tripPlannerDark)
                    Text(role.rawValue)
                        .font(.headline)
                        .foregroundColor(.gray)
                        .foregroundColor(.tripPlannerDark)
                }
                .padding(.top, 10)

                Spacer() // Espaciador para empujar el botón hacia abajo

                // Botón de Logout
                Button(action: {
                    // Aquí puedes agregar la lógica para cerrar sesión
                    print("Logout tapped")
                    authenticationContext.logout()
                }) {
                    Text("Logout")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.tripPlannerBackground.gradient)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 50) // Margen inferior
            }
        }
            .onAppear {
                loadData()
            }
    }
    
    func loadData() {
        guard let user = authenticationContext.user else {
            firstName = "Sergio"
            lastName = "Cabrera"
            role = .Worker
            return
        }
        
        firstName = user.firstName
        lastName = user.lastName
        role = user.role
  
    }
}

