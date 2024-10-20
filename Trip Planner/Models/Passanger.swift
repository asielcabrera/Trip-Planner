//
//  Passanger.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

enum Passanger {
    struct Input: Codable, Identifiable {
        var id: UUID
        var firstName: String
        var lastName: String
        var address: String
        
        var assistence: [WeekDay] = []
    }
    struct Output: Codable, Identifiable {
        var id: UUID
        var firstName: String
        var lastName: String
        var address: String
        
        var assistence: [WeekDay] = []
    }
}


enum WeekDay: String, Codable, CaseIterable {
    case monday, tuesday, wednesday, thursday
}
