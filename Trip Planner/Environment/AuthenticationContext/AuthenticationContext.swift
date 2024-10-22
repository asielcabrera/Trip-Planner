//
//  AuthenticationContext.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/21/24.
//

import SwiftUI

@Observable
public final class AuthenticationContext {
    public var user: User? {
        User(id: .init(), firstName: "Asiel", lastName: "Cabrera")
    }
    
    public private(set) var isLoggedIn: Bool = false
    
    public var token: String? {
        get {
            print("getting")
            return UserDefaults.standard.string(forKey: "token")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
            isLoggedIn = newValue != nil
        }
    }
    
    public  init() {
        checkIsLoggedIn()
    }
    
    public func checkIsLoggedIn() {
        if token != nil {
            isLoggedIn = true
        } else {
            login(credencial: Credencial())
        }
    }
    
    public func logout() {
        self.token = nil
    }
    
    public func login(credencial: Credencial) {
        self.token = "tokenExample"
    }
}


public struct Credencial: Codable {
    
}
