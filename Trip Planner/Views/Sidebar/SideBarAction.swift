//
//  SideBarAction.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/20/24.
//

import SwiftUI

enum SideBarAction: String, CaseIterable {
    case trips = "Trips"
    case workers = "Workers"
    case settings = "Settings"
    case assistence = "Assistance"
    case passangers = "Passangers"
    
    case logout = "Logout"
    
    var symbolImage: String {
        switch self {
        case .trips: return "car.fill"
        case .workers: return "person.3.fill"
        case .settings: return "gearshape"
        case .assistence: return "hand.raised.fill"
        case .passangers: return "person.2.fill"
        case .logout: return "rectangle.portrait.and.arrow.forward.fill"
        }
    }
    
    static var primary: [Self] = [.trips, .workers, .assistence, .passangers]
    static var secondary: [Self] = [.settings, .logout]
    
}
