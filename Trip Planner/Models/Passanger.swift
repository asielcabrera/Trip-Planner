//
//  Passanger.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation
import SwiftData

@Model
final class Passanger: Identifiable {
    @Attribute(.unique) var id: UUID
    var firstName: String
    var lastName: String
    var address: String
    
    var assistence: [WeekDay] = []
    
    init(id: UUID = UUID(), firstName: String, lastName: String, address: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
    }
}


enum WeekDay: String, Codable, CaseIterable {
    case monday, tuesday, wednesday, thursday
}
