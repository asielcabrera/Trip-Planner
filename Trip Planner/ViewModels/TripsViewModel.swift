//
//  TripsViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

@Observable
final class TripsViewModel {
    var trips: [Trip] = []
    
    func addTrip(dateFor: Date, status: Status, points: [Point]) {
            let newTrip = Trip(dateFor: dateFor, status: status, points: points)
            trips.append(newTrip)
        }
    
    func deleteTrip(at offsets: IndexSet) {
        trips.remove(atOffsets: offsets)
    }
}
