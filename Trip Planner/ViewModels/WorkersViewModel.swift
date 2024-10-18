//
//  WorkersViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

@Observable
class WorkersViewModel {
    var workers: [Worker] = []
    
    func addWorker(firstName: String, lastName: String, role: Role) {
        let newWorker = Worker(firstName: firstName, lastName: lastName, role: role)
        workers.append(newWorker)
    }
    
    func deleteWorker(at offsets: IndexSet) {
        workers.remove(atOffsets: offsets)
    }
}
