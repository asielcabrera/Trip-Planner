//
//  Assistence.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

enum Assistence {
    struct Input: Codable, Identifiable {
        var id: UUID
        var assistenceDay: Date
        var passanger: [Passanger.Input]?
        
        var conffirmationComplete: Bool
        
        init(id: UUID, assistenceDay: Date, passanger: [Passanger.Input]? = nil, conffirmationComplete: Bool) {
            self.id = id
            self.assistenceDay = assistenceDay
            self.passanger = passanger
            self.conffirmationComplete = conffirmationComplete
        }
    }
    
    struct Output: Codable, Identifiable {
        var id: UUID
        var assistenceDay: Date
        var passanger: [Passanger.Input]?
        
        var conffirmationComplete: Bool
    }
}
