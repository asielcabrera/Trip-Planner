//
//  MessageWrapper.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import Foundation

struct MessageWrapper: Identifiable {
    let id: UUID = UUID()
    var message: String
    var delay: Double = 2.0
    var messageType: MessageType = .error
}
