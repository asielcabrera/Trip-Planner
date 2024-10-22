//
//  WorkersView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

struct WorkersView: View {
    
    @Binding var viewModel: WorkersViewModel
    @State var showingAddWorkerView = false
    @Binding var showMenu: Bool
    
    var body: some View {
        BaseLayoutView(
            tittle: "Workers",
            plusButtonAction: {
                showingAddWorkerView = true
            },
            showMenu: $showMenu) {
                if viewModel.workers.isEmpty {
                    Spacer()
                    HStack(alignment: .center) {
                        Spacer()
                        EmptyListView
                            .padding()
                        Spacer()
                    }
                    Spacer()
                } else {
                    WorkersListView
                        .padding(.vertical)
                }
                
            }
            .sheet(isPresented: $showingAddWorkerView) {
                AddWorkerView(viewModel: viewModel)
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
            ForEach(viewModel.workers) { worker in
                WorkersListRowView(worker: worker)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            viewModel.deleteWorker(worker)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
            }
            
        }
        .scrollIndicators(.hidden)
    }
    
    @ViewBuilder
    func WorkersListRowView(worker: Worker.Input) -> some View {
        CustomListRowView {
            HStack {
                VStack(alignment: .leading) {
                    Text(worker.firstName + worker.lastName)
                        .font(.title3)
                        .foregroundStyle(.white)
                    Text(worker.role.rawValue)
                        .font(.caption2)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                VStack {
                    NavigationLink {
                        Text("Edit Worker View")
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


struct WorkerRowView: View {
    
    let worker: Worker.Input
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(worker.firstName) \(worker.lastName)")
                .font(.headline)
            Text(worker.role.rawValue)
                .font(.subheadline)
        }
    }
}



struct WorkerDetailView: View {
    let worker: Worker.Input
    
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
