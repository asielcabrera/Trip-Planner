//
//  LoginView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/18/24.
//


import SwiftUI
import SwiftData


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String? = nil
    @State private var isLoading = false
    @State private var showingCreateUser = false

    @Environment(\.authenticationContext) var authenticationContext
    
    
    var body: some View {
        BaseLayoutView(
            showTittleView: false,
            showHeaderView: false,
            showMenu: .constant(false)
        ) {
            
            VStack(spacing: 20) {
                 
                    Spacer()
                Text("Trip Planner")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.tripPlannerBackground)
               
                
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.tripPlannerBackground)
                    
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .foregroundStyle(.tripPlannerBackground)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        .frame(height: 35)
                        .foregroundColor(.tripPlannerBackground)

                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                    
                        Button(action: {
                            authenticationContext.login(credencial: .init())
                        }) {
                            
                            Text("Login")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.tripPlannerBackground.gradient)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .preferredColorScheme(.light)
                            
                        }
                    .disabled(isLoading)
                    .padding(.top, 20)
                    
                Spacer()
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

        UserDefaults.standard.set("Token", forKey: "authToken")
        
        print("login")
        
     
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                isLoading = false
//
//                if let error = error {
//                    errorMessage = "Error: \(error.localizedDescription)"
//                    return
//                }
//
//                guard let data = data else {
//                    errorMessage = "No data received."
//                    return
//                }
//
//                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//                    // Autenticación exitosa, manejar el token o redirigir a la vista principal
//                    print("Login successful")
//                } else {
//                    errorMessage = "Login failed."
//                }
//            }
//        }.resume()
    }
}

#Preview {
    LoginView()
}
