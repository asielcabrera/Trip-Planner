//
//  AuthenticationViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/18/24.
//

import SwiftUI

@Observable
final class AuthenticationViewModel: ObservableObject {
    var isLoggedIn: Bool = false
    var user: User? = User(id: UUID(), name: "Asiel Cabrera")
    
    init() {
        self.checkToken()
    }
    
    func checkToken() {
        if let token = UserDefaults.standard.string(forKey: "authToken") {
            // Hacer una llamada a la API para verificar el token
            verifyToken(token)
        } else {
            // No hay token almacenado, el usuario debe iniciar sesión
            isLoggedIn = false
        }
    }
    
    // Función para verificar el token con el servidor
    func verifyToken(_ token: String) {
        guard let url = URL(string: "https://tu-servidor.com/verify-token") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error verifying token: \(error.localizedDescription)")
                    self.isLoggedIn = false
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    // Token inválido o expirado
                    self.isLoggedIn = false
                    return
                }
                
                // El token es válido
                self.isLoggedIn = true
            }
        }.resume()
    }
    
    // Función para cerrar sesión
    func logout() {
        UserDefaults.standard.removeObject(forKey: "authToken")
        isLoggedIn = false
    }
}


struct User: Codable, Identifiable {
    let id: UUID
    let name: String
    var role: Role = .Worker
}
