//
//  TripRowView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/19/24.
//

import SwiftUI

struct TripRowView: View {
    let trip: Trip.Input
    
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
