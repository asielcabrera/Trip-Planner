//
//  Passanger.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

public enum Passanger {
    public struct Input: Codable, Identifiable {
        public var id: UUID
        public var firstName: String
        public var lastName: String
        public var address: String
        
        public var assistence: [WeekDay] = []
    }
    public struct Output: Codable, Identifiable {
        public var id: UUID
        public var firstName: String
        public var lastName: String
        public var address: String
        
        public var assistence: [WeekDay] = []
    }
}


public enum WeekDay: String, Codable, CaseIterable {
    case monday, tuesday, wednesday, thursday
}
