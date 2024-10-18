//
//  WorkersView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

struct WorkersView: View {
    
    private var viewModel = WorkersViewModel()
    @State private var showingAddWorkerView = false
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(viewModel.workers) { worker in
                    NavigationLink(destination: WorkerDetailView(worker: worker)) {
                        WorkerRowView(worker: worker) // Mostrar los detalles básicos del viaje en la lista
                    }
                }
                .onDelete(perform: viewModel.deleteWorker)
            }
            .navigationTitle("Workers")
            .navigationBarItems(trailing: Button(action: {
                showingAddWorkerView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddWorkerView) {
                AddWorkerView(viewModel: viewModel)
            }
        }
    }
}


struct WorkerRowView: View {
    
    let worker: Worker
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(worker.firstName) \(worker.lastName)")
                .font(.headline)
            Text(worker.role.rawValue)
                .font(.subheadline)
        }
    }
}


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


struct WorkerDetailView: View {
    let worker: Worker
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("First Name: \(worker.firstName)")
            Text("Last Name: \(worker.lastName)")
            Text("Role: \(worker.role.rawValue)")
        }
        .padding()
        .navigationBarTitle("Worker Details", displayMode: .inline)
    }
}
