//
//  Assistence.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

public enum Assistence {
    public struct Input: Codable, Identifiable {
        public var id: UUID
        public var assistenceDay: Date
        public var passanger: [Passanger.Input]?
        
        public var conffirmationComplete: Bool
        
        public init(id: UUID, assistenceDay: Date, passanger: [Passanger.Input]? = nil, conffirmationComplete: Bool) {
            self.id = id
            self.assistenceDay = assistenceDay
            self.passanger = passanger
            self.conffirmationComplete = conffirmationComplete
        }
    }
    
    public struct Output: Codable, Identifiable {
        public var id: UUID
        public var assistenceDay: Date
        public var passanger: [Passanger.Input]?
        
        public var conffirmationComplete: Bool
    }
}
