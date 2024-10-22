//
//  Role.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

public enum Role: String, Codable, CaseIterable, Identifiable {
    case Admin = "Administrator"
    case Moderator = "Moderator"
    case Worker = "Worker"
    
    public var id: String { self.rawValue }
}
