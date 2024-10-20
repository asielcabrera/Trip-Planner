//
//  Trip.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation
import SwiftData

@Model
final class Trip {
    var dateFor: Date
    var status: Status
    var points: [Point]
    
    init(dateFor: Date, status: Status, points: [Point]) {
        self.dateFor = dateFor
        self.status = status
        self.points = points
    }
}

struct Point: Codable {
    let latitude, longitude: Double
}


enum Status: String, Codable, CaseIterable, Identifiable {
    case pending, inProgress, completed
    
    var id: String { self.rawValue }
}
