//
//  TripsView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

struct TripsView: View {
    
    private var viewModel = TripsViewModel()
    @State private var showingAddTripView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.trips) { trip in
                    NavigationLink(destination: TripDetailView(trip: trip)) {
                        TripRowView(trip: trip) // Mostrar los detalles básicos del viaje en la lista
                    }
                }
                .onDelete(perform: viewModel.deleteTrip)
            }
            .sheet(isPresented: $showingAddTripView, content: {
                AddTripView(viewModel: viewModel)
            })
            .navigationBarTitle("Trips")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddTripView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    
    // Formatter para mostrar la fecha
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}


struct TripRowView: View {
    let trip: Trip
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Date: \(trip.dateFor, formatter: dateFormatter)")
                .font(.headline)
            Text("Status: \(trip.status.rawValue.capitalized)")
                .font(.subheadline)
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

struct AddTripView: View {
    @Environment(\.dismiss) var dismiss
    @State private var dateFor = Date()
    @State private var selectedStatus: Status = .pending
    @State private var points: [Point] = []
    
    var viewModel: TripsViewModel
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("Date", selection: $dateFor, displayedComponents: .date)
                
                Picker("Status", selection: $selectedStatus) {
                    ForEach(Status.allCases) { status in
                        Text(status.rawValue.capitalized).tag(status)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Section(header: Text("Points")) {
                    ForEach(points, id: \.latitude) { point in
                        Text("Lat: \(point.latitude), Lon: \(point.longitude)")
                    }
                    Button("Add Point") {
                        // Agregar un punto ficticio, en una implementación real sería un formulario o mapa
                        points.append(Point(latitude: 0.0, longitude: 0.0))
                    }
                }
                
                Button("Add Trip") {
                    viewModel.addTrip(dateFor: dateFor, status: selectedStatus, points: points)
                    dismiss()
                }
            }
            .navigationTitle("New Trip")
            .navigationBarItems(leading: Button("Cancel") {
                dismiss()
            })
        }
    }
}
