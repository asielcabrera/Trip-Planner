//
//  TripDetailView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//


import SwiftUI
import MapKit
import SwiftData


struct TripDetailView: View {
    let trip: Trip.Input
    
    @State private var region = MKCoordinateRegion()
    @State private var polyline: MKPolyline?
    
    var body: some View {
        VStack {
            Text("Trip Details")
                .font(.largeTitle)
                .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Date: \(trip.dateFor, formatter: dateFormatter)")
                    .font(.headline)
                Text("Status: \(trip.status.rawValue.capitalized)")
                    .font(.subheadline)
            }
            .padding(.horizontal)
            
            MapView(points: trip.points, region: $region, polyline: $polyline)
                .frame(height: 300)
                .onAppear {
                    updateRegionAndPolyline()
                }
            
            Spacer()
        }
        .navigationBarTitle("Trip Details", displayMode: .inline)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    private func updateRegionAndPolyline() {
        if let firstPoint = trip.points.first {
            region.center = CLLocationCoordinate2D(latitude: firstPoint.latitude, longitude: firstPoint.longitude)
            region.span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        }
        
        let coordinates = trip.points.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) }
        polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
    }
}
