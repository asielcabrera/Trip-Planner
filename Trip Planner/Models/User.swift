//
//  User.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/20/24.
//

import Foundation

public struct User: Codable, Identifiable {
    public let id: UUID
    public let firstName: String
    public let lastName: String
    public var role: Role = .Worker
}
