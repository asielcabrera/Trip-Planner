//
//  Assistence.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation
import SwiftData

@Model
final class Assistence {
    @Attribute(.unique) var id: UUID
    var assistenceDay: Date
    
    @Relationship(deleteRule: .cascade, inverse: \Passanger.assistence)
    var passanger: [Passanger]?
    
    var conffirmationComplete: Bool
    
    init(id: UUID, assistenceDay: Date, passanger: [Passanger]) {
        self.id = id
        self.assistenceDay = assistenceDay
        self.passanger = passanger
        conffirmationComplete = false
    }
}
