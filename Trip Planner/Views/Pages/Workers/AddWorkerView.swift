//
//  AddWorkerView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import SwiftUI

struct AddWorkerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var selectedRole: Role = .Worker
    var viewModel: WorkersViewModel
    
    var body: some View {
        NavigationView {
            Form {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                Picker("Role", selection: $selectedRole) {
                    ForEach(Role.allCases) { role in
                        Text(role.rawValue).tag(role)
                    }
                }
                .pickerStyle(SegmentedPickerStyle()) // Puedes cambiar el estilo del picker
                
                
                Button("Add Worker") {
                    viewModel.addWorker(firstName: firstName, lastName: lastName, role: selectedRole)
                    dismiss()
                }
            }
            .navigationTitle("New Worker")
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
        }
    }
}

