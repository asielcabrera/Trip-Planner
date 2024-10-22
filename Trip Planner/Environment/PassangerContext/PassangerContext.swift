//
//  PassangerContext.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import SwiftUI

@Observable
public final class PassangerContext {
    
    public var passangers: [Passanger.Input] = []
    
    public func addPassanger(firstName: String, lastName: String, address: String) {
        let trip = Passanger.Input(id: .init(), firstName: firstName, lastName: lastName, address: address)
        passangers.append(trip)
    }
    
    public func deletePassanger(_ passanger: Passanger.Input) {
        guard let index = passangers.firstIndex(where: { $0.id == passanger.id } ) else { return }
        passangers.remove(at: index)
    }
}
