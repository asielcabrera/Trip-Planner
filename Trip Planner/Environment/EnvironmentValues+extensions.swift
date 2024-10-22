//
//  EnvironmentValues+extensions.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/21/24.
//

import SwiftUI

public extension EnvironmentValues {
    var authenticationContext: AuthenticationContext {
        get { self[AuthenticationContextKey.self] }
        set { self[AuthenticationContextKey.self] = newValue }
    }
    
    var onBoardingContext: OnBoardingContext {
        get { self[OnBoardingContextKey.self] }
        set { self[OnBoardingContextKey.self] = newValue }
    }
}
