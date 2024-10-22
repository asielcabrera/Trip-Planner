//
//  ShowMessageEnvironmentKey.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import Foundation
import SwiftUI

struct ShowMessageAction {
    typealias Action = (String, MessageType) -> ()
    let action: Action

    func callAsFunction(_ message: String, _ messageType: MessageType = .error) {
        action(message, messageType)
    }
}

extension EnvironmentValues {
    @Entry var showMessage: ShowMessageAction = ShowMessageAction { _, _ in }
}
