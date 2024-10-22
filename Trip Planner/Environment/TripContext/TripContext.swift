//
//  TripContext.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import SwiftUI

@Observable
public final class TripContext {
    
    public var trips: [Trip.Input] = []
    
    public func addWorker(firstName: String, lastName: String, email: String, role: Role) {
        let trip = Trip.Input(id: .init(), dateFor: .now)
        trips.append(trip)
    }
    
    public func deleteWorker(_ trip: Trip.Input) {
        guard let index = trips.firstIndex(where: { $0.id == trip.id } ) else { return }
        trips.remove(at: index)
    }
}
