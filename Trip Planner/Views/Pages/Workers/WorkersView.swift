//
//  WorkersView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

struct WorkersView: View {
    
    var viewModel = WorkersViewModel()
    @State var showingAddWorkerView = false
    @Binding var showMenu: Bool
    
    var body: some View {
        
        BaseLayoutView(
            tittle: "Workers",
            plusButtonAction: {
                showingAddWorkerView = true
            },
            showMenu: $showMenu) {
                List {
                    ForEach(viewModel.workers) { worker in
                        NavigationLink(destination: WorkerDetailView(worker: worker)) {
                            WorkerRowView(worker: worker) // Mostrar los detalles básicos del viaje en la lista
                        }
                    }
                    .onDelete(perform: viewModel.deleteWorker)
                }
                
                .sheet(isPresented: $showingAddWorkerView) {
                    AddWorkerView(viewModel: viewModel)
                }
            }

    }
    
    var EmptyListView: some View {
        VStack(alignment: .center) {
            Text("Workers will appear here")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    var WorkersListView: some View {
        ScrollView {
            ForEach(allTrips) { trip in
                TripListRowView(trip: trip)
            }
            .onDelete(perform: deleteTrip)
        }
        .swipeActions(content: {
            
        })
        .scrollIndicators(.hidden)
    }
    
    @ViewBuilder
    func WorkersListRowView(worker: Workers.Input) -> some View {
        CustomListRowView {
            HStack {
                VStack(alignment: .leading) {
                    Text(trip.dateFor.description)
                        .font(.title3)
                        .foregroundStyle(.black)
                    Text(trip.status.rawValue)
                        .font(.caption2)
                        .foregroundStyle(Color.tripPlannerDark)
                }
                
                Spacer()
                
                VStack {
                    Text("\(trip.points.count)")
                        .foregroundStyle(Color.tripPlannerDark)
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
