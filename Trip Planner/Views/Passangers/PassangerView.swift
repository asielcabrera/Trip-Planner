//
//  PassangerView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI
import SwiftData


struct PassangerView: View {
    var viewModel: PassangerViewModel = .init()
    @State private var showingAddPassangerView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.passangers) { passanger in
                    NavigationLink(destination: PassangerDetailView(passanger: passanger)) {
                        PassangerRowView(passanger: passanger)
                    }
                }
                .onDelete(perform: viewModel.deletePassanger)
            }
            .sheet(isPresented: $showingAddPassangerView, content: {
                AddPassangerView(viewModel: viewModel)
            })
            .navigationBarTitle("Passangers")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddPassangerView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct PassangerRowView: View {
    let passanger: Passanger
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(passanger.firstName) \(passanger.lastName)")
                .font(.headline)
            Text(passanger.address)
                .font(.subheadline)
        }
    }
}


struct PassangerDetailView: View {
    let passanger: Passanger
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("First Name: \(passanger.firstName)")
            Text("Last Name: \(passanger.lastName)")
            Text("Address: \(passanger.address)")
        }
        .padding()
        .navigationBarTitle("Passanger Details", displayMode: .inline)
    }
}

struct AddPassangerView: View {
    @Environment(\.dismiss) var dismiss
   
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var address: String = ""
    
    var viewModel: PassangerViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Passenger Information")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Address", text: $address)
                }
                
                Button(action: addPassanger) {
                    Text("Add Passenger")
                        .frame(maxWidth: .infinity)
                }
                .disabled(firstName.isEmpty || lastName.isEmpty || address.isEmpty)
            }
            .navigationBarTitle("Add Passenger", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addPassanger() {
        let newPassanger = Passanger(firstName: firstName, lastName: lastName, address: address)
        viewModel.passangers.append(newPassanger)
        dismiss() // Cerrar la vista al añadir
    }
}
