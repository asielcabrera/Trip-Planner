//
//  ProfileView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = "John" // Cambia estos valores según sea necesario
    @State private var lastName: String = "Doe"
    @State private var role: Role = .Worker // Asigna el rol correspondiente

    var body: some View {
        VStack {
            // Icono de persona centrado
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.top, 50) // Margen superior

            // Nombre y apellido
            Text("\(firstName) \(lastName)")
                .font(.largeTitle)
                .padding(.top, 20)

            // Rol del usuario
            HStack {
                Text("Position:")
                    .font(.headline)
                Text(role.rawValue)
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .padding(.top, 10)

            Spacer() // Espaciador para empujar el botón hacia abajo

            // Botón de Logout
            Button(action: {
                // Aquí puedes agregar la lógica para cerrar sesión
                print("Logout tapped")
            }) {
                Text("Logout")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 50) // Margen inferior
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

