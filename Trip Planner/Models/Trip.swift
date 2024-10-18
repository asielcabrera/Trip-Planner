//
//  Trip.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation
import SwiftData

@Model
final class Trip: Identifiable {
    @Attribute(.unique) var id: UUID
    var dateFor: Date
    var status: Status
    var points: [Point]
    
    init(id: UUID = UUID(), dateFor: Date, status: Status, points: [Point]) {
        self.id = id
        self.dateFor = dateFor
        self.status = status
        self.points = points
    }
}

struct Point: Codable, Identifiable {
    var id: String { "\(latitude) - \(longitude)"}
    let latitude, longitude: Double
}


enum Status: String, Codable, CaseIterable, Identifiable {
    case pending, inProgress, completed
    
    var id: String { self.rawValue }
}
