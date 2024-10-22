//
//  PassangerViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//


import Foundation

@Observable
final class PassangerViewModel {
    var passangers: [Passanger.Input] = [
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", address: "11615 sw 170st, Miami, FL 33157"),
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", address: "11615 sw 170st, Miami, FL 33157"),
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", address: "11615 sw 170st, Miami, FL 33157"),
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", address: "11615 sw 170st, Miami, FL 33157"),
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", address: "11615 sw 170st, Miami, FL 33157")
    ]
    
    func addPassanger() {
        let newPassanger = Passanger.Input(id: .init(), firstName: "New", lastName: "Passanger", address: "Address")
        passangers.append(newPassanger)
    }
    
    func deletePassanger(at offsets: IndexSet) {
        passangers.remove(atOffsets: offsets)
    }
    
    func deletePassanger(_ passanger: Passanger.Input) {
        guard let index = passangers.firstIndex(where: {$0.id == passanger.id }) else { return }
        passangers.remove(at: index)
    }
}
