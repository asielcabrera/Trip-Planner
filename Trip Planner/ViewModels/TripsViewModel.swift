//
//  TripsViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//


import SwiftUI
import SwiftData


@Observable
final class TripsViewModel {
    
    func addTrip(dateFor: Date, status: Status, points: [Point]) {
        let newTrip = Trip(dateFor: dateFor, status: status, points: points)
//        try newTrip.modelContext?.save()
    }
    
    func deleteTrip(_ trip: Trip) {
//        trip.modelContext?.delete(<#T##T#>)
    }
}
