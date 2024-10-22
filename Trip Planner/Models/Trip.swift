//
//  Trip.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

public enum Trip {
    public struct Input: Codable, Identifiable {
        
        public var id: UUID
        public var dateFor: Date
        public var status: Status
        public var points: [Point]
        
        public init(id: UUID, dateFor: Date, status: Status = .pending, points: [Point] = []) {
            self.id = id
            self.dateFor = dateFor
            self.status = status
            self.points = points
        }
    }
}
public struct Point: Codable {
    public let latitude, longitude: Double
    }
    
    
public enum Status: String, Codable, CaseIterable, Identifiable {
    case pending, inProgress, completed
        
    public var id: String { self.rawValue }
    }
