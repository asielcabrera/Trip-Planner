//
//  Worker.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation
import SwiftData

@Model
final class Worker: Identifiable {
    var firstName: String
    var lastName: String
    var role: Role
    
    init(firstName: String, lastName: String, role: Role) {
        self.firstName = firstName
        self.lastName = lastName
        self.role = role
    }
}
