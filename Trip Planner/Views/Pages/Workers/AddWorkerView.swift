//
//  AddWorkerView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import SwiftUI

struct AddWorkerView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.workerContext) var workerContext
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var selectedRole: Role = .Worker
    
    @State private var errorMessage: String? = nil
    @State private var isLoading = false
    
    
    var body: some View {
        BaseLayoutView(
            showTittleView: false,
            showHeaderView: false,
            showMenu: .constant(false)
        ) {
            
            VStack(alignment: .leading, spacing: 20) {
                Text("New Worker")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.tripPlannerBackground)
                
                    Spacer()
        
                TextField("FirstName", text: $firstName)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        .foregroundStyle(.tripPlannerBackground)

                TextField("LastName", text: $lastName)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                        .foregroundStyle(.tripPlannerBackground)

                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .foregroundStyle(.tripPlannerBackground)
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                    
                        Button(action: {
                            workerContext.addWorker(firstName: firstName, lastName: lastName, email: email, role: .Admin)
                            dismiss()
                        }) {
                            
                            Text("Add Worker")
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
}

#Preview {
    AddWorkerView()
}
