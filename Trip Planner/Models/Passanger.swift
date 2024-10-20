//
//  Passanger.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation
import SwiftData

@Model
final class Passanger {
    var firstName: String
    var lastName: String
    var address: String
    
    var assistence: [WeekDay] = []
    
    init(firstName: String, lastName: String, address: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
    }
}


enum WeekDay: String, Codable, CaseIterable {
    case monday, tuesday, wednesday, thursday
}
