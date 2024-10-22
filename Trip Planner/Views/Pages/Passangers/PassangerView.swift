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
    @Binding var showMenu: Bool
    var body: some View {
        
        BaseLayoutView(
            tittle: "Passangers",
            plusButtonAction: {
                showingAddPassangerView = true
            },
            showMenu: $showMenu) {
                if viewModel.passangers.isEmpty {
                    Spacer()
                    HStack(alignment: .center) {
                        Spacer()
                        EmptyListView
                            .padding()
                        Spacer()
                    }
                    Spacer()
                } else {
                PassangersListView
                        .padding(.vertical)
                }
                
            }
            .sheet(isPresented: $showingAddPassangerView) {
                AddPassangerView(viewModel: viewModel)
            }
    }
    
    
    var EmptyListView: some View {
        VStack(alignment: .center) {
            Text("Passanger will appear here")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    var PassangersListView: some View {
        ScrollView {
            ForEach(viewModel.passangers) { passanger in
                PassangerListRowView(passanger: passanger)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            viewModel.deletePassanger(passanger)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
            }
            
        }
        .scrollIndicators(.hidden)
    }
    
    @ViewBuilder
    func PassangerListRowView(passanger: Passanger.Input) -> some View {
        CustomListRowView {
            HStack {
                VStack(alignment: .leading) {
                    Text(passanger.firstName + passanger.lastName)
                        .font(.title3)
                        .foregroundStyle(.white)
                    Text(passanger.address)
                        .font(.caption2)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                VStack {
                    NavigationLink {
                        Text("Edit Passanger View")
                    } label: {
                        Text("Edit")
                            .foregroundStyle(.tripPlannerDark)
                    }
                    
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct PassangerRowView: View {
    let passanger: Passanger.Input
    
    var body: some View {
        CustomListRowView {
            VStack(alignment: .leading) {
                Text("\(passanger.firstName) \(passanger.lastName)")
                    .font(.headline)
                Text(passanger.address)
                    .font(.subheadline)
            }
        }
    }
}

struct PassangerDetailView: View {
    let passanger: Passanger.Input
    
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
        let newPassanger = Passanger.Input(id: .init(), firstName: firstName, lastName: lastName, address: address)
        viewModel.passangers.append(newPassanger)
        dismiss() // Cerrar la vista al añadir
    }
}
