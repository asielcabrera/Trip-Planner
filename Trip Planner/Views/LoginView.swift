//
//  LoginView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/18/24.
//


import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String? = nil
    @State private var isLoading = false
    @State private var showingCreateUser = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
                Button(action: {
                    loginUser()
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(isLoading ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                .disabled(isLoading)
                .padding(.top, 20)
                
                Spacer()

                Button(action: {
                    showingCreateUser = true
                }) {
                    Text("Create Account")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $showingCreateUser) {
                    CreateUserView()
                }
            }
            .padding()
        }
    }

    // Lógica para iniciar sesión
    func loginUser() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill out all fields."
            return
        }

        isLoading = true
        errorMessage = nil
        
        // Llamada a la API para iniciar sesión
        guard let url = URL(string: "https://tu-servidor.com/login") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let loginData = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: loginData)

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false

                if let error = error {
                    errorMessage = "Error: \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    errorMessage = "No data received."
                    return
                }

                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    // Autenticación exitosa, manejar el token o redirigir a la vista principal
                    print("Login successful")
                } else {
                    errorMessage = "Login failed."
                }
            }
        }.resume()
    }
}

#Preview {
    LoginView()
}
