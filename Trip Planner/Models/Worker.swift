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
    
    @Attribute(.unique) var id: UUID
    var firstName: String
    var lastName: String
    var role: Role
    
    init(id: UUID = UUID(), firstName: String, lastName: String, role: Role) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.role = role
    }
}
