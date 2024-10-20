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
    var assistenceDay: Date
    var passanger: [Passanger]?
    
    var conffirmationComplete: Bool
    
    init(assistenceDay: Date, passanger: [Passanger]) {
        self.assistenceDay = assistenceDay
        self.passanger = passanger
        conffirmationComplete = false
    }
}
