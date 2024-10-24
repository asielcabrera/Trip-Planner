//
//  Constants.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import Foundation

struct Constants {
    
    struct Urls {
        
//        static let register: URL = URL(string: "http://localhost:8080/api/auth/register")!
        static let login: URL = URL(string: "http://localhost:8080/api/auth/login")!
        static let products: URL = URL(string: "http://localhost:8080/api/products")!
        static let createProduct = URL(string: "http://localhost:8080/api/products")!
       
        static func deleteProduct(_ productId: Int) -> URL {
            URL(string: "http://localhost:8080/api/products/\(productId)")!
        }
        
        static func myProducts(_ userId: Int) -> URL {
            URL(string: "http://localhost:8080/api/products/user/\(userId)")!
        }
        
        static func updateProduct(_ productId: Int) -> URL {
            URL(string: "http://localhost:8080/api/products/\(productId)")!
        }
    }
    
}
