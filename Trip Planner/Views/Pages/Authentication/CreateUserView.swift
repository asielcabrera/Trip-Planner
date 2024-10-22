//
//  CreateUserView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/18/24.
//


import SwiftUI
import SwiftData


struct CreateUserView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage: String? = nil
    @State private var isLoading = false

    var body: some View {
        VStack {
            Spacer()
            
            Text("Create Account")
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

            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }
            
            Button(action: {
                createUser()
            }) {
                Text("Create Account")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(isLoading ? Color.gray : Color.green)
                    .cornerRadius(10)
            }
            .disabled(isLoading)
            .padding(.top, 20)

            Spacer()
        }
        .padding()
    }

    // Lógica para crear un usuario
    func createUser() {
        guard !email.isEmpty, !password.isEmpty, password == confirmPassword else {
            errorMessage = "Please check all fields and confirm your password."
            return
        }

        isLoading = true
        errorMessage = nil
        
        // Llamada a la API para crear un nuevo usuario
        guard let url = URL(string: "https://tu-servidor.com/register") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let userData = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: userData)

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

                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
                    // Usuario creado exitosamente
                    print("User created successfully")
                } else {
                    errorMessage = "User creation failed."
                }
            }
        }.resume()
    }
}



#Preview {
    CreateUserView()
}
