//
//  AddTripView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/19/24.
//

import SwiftUI
import SwiftData

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
