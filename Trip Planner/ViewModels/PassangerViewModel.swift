//
//  PassangerViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//


import Foundation

@Observable
final class PassangerViewModel {
    var passangers: [Passanger] = []
    
    func addPassanger() {
        let newPassanger = Passanger(firstName: "New", lastName: "Passanger", address: "Address")
        passangers.append(newPassanger)
    }
    
    func deletePassanger(at offsets: IndexSet) {
        passangers.remove(atOffsets: offsets)
    }
}
