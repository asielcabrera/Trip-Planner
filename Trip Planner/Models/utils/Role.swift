//
//  Role.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

enum Role: String, Codable, CaseIterable, Identifiable {
    case Admin = "Administrator"
    case Moderator = "Moderator"
    case Worker = "Worker"
    
    var id: String { self.rawValue }
}
