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
    var trips: [Trip.Input] = [
        .init(id: .init(), dateFor: .distantFuture),
        .init(id: .init(), dateFor: .distantFuture),
        .init(id: .init(), dateFor: .distantFuture),
        .init(id: .init(), dateFor: .distantFuture)
    ]
    
    func addTrip(dateFor: Date, status: Status, points: [Point]) {
        let trip = Trip.Input(id: .init(), dateFor: dateFor, status: status, points: points)
        trips.append(trip)
    }
    
    func updateTrip(_ trip: Trip.Input) {
        guard let index = trips.firstIndex (where: { $0.id == trip.id }) else { return }
        trips[index] = trip
    }
        
    func deleteTrip(_ indexSet: IndexSet) {
        for index in indexSet {
            trips.remove(at: index)
        }
    }
}
