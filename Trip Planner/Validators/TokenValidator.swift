//
//  TokenValidator.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//


import Foundation

struct TokenValidator {
    
    static func validate(token: String?) -> Bool {
        
        guard let token = token else { return false }
        
        do {
           
            let jwt = try decode(jwt: token)
            
            // Access specific claim - expiration
            if let expirationDate = jwt.expiresAt {
                let currentDate = Date()
                
                // Check if the token has expired
                if currentDate >= expirationDate {
                    return false
                } else {
                    return true
                }
            } else {
                return false // Treat token as invalid if there's no expiration date
            }
        } catch {
            return false // Treat token as invalid if decoding fails
        }
        
    }
    
}
