//
//  Worker.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

enum Worker {
    struct Input: Codable, Identifiable {
        var id: UUID
        
        var firstName: String
        var lastName: String
        var role: Role
        
        init(id: UUID, firstName: String, lastName: String, role: Role) {
            self.id = id
            self.firstName = firstName
            self.lastName = lastName
            self.role = role
        }
    }
    
    struct Output: Codable, Identifiable {
        var id: UUID
        
        var firstName: String
        var lastName: String
        var role: Role
    }
}
