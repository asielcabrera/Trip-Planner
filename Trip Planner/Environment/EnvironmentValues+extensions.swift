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
    
    var workerContext: WorkerContext {
        get { self[WorkerContextKey.self] }
        set { self[WorkerContextKey.self] = newValue }
    }
    
    var tripContext: TripContext {
        get { self[TripContextKey.self] }
        set { self[TripContextKey.self] = newValue }
    }
    
    var passangerContext: PassangerContext {
        get { self[PassangerContextKey.self] }
        set { self[PassangerContextKey.self] = newValue }
    }
    
    var assistenceContext: AssistenceContext {
        get { self[AssistenceContextKey.self] }
        set { self[AssistenceContextKey.self] = newValue }
    }
}
