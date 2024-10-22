//
//  Worker.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

public enum Worker {
    public struct Input: Codable, Identifiable {
        public var id: UUID
        
        public var firstName: String
        public var lastName: String
        public var email: String
        public var role: Role
        
        public   init(id: UUID, firstName: String, lastName: String, email: String, role: Role) {
            self.id = id
            self.firstName = firstName
            self.lastName = lastName
            self.email = email
            self.role = role
        }
    }
    
    public struct Output: Codable, Identifiable {
        public var id: UUID
        
        public var firstName: String
        public var lastName: String
        public var email: String
        public var role: Role
    }
}
