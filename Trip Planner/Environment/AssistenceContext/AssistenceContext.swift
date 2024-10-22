//
//  AssistenceContext.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import SwiftUI

@Observable
public final class AssistenceContext {
    
    public var assistences: [Assistence.Input] = []
    
    public func addAssistence(firstName: String, lastName: String, email: String, role: Role) {
        let assistence = Assistence.Input(id: .init(), assistenceDay: .now, conffirmationComplete: false)
        assistences.append(assistence)
    }
    
    public func deleteAssistence(_ assistence: Assistence.Input) {
        guard let index = assistences.firstIndex(where: { $0.id == assistence.id } ) else { return }
        assistences.remove(at: index)
    }
}
