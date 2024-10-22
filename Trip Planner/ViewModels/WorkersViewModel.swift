//
//  WorkersViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

@Observable
class WorkersViewModel {
    var workers: [Worker.Input] = [
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", role: .Worker),
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", role: .Worker),
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", role: .Worker),
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", role: .Worker),
        .init(id: .init(), firstName: "Asiel", lastName: "Cabrera", role: .Worker)
    ]
    
    func addWorker(firstName: String, lastName: String, role: Role) {
        let newWorker = Worker.Input(id: .init(), firstName: firstName, lastName: lastName, role: role)
        workers.append(newWorker)
    }
    
    func deleteWorker(at offsets: IndexSet) {
        workers.remove(atOffsets: offsets)
    }
    
    func deleteWorker(_ worker: Worker.Input) {
        guard let index = workers.firstIndex(where: { $0.id == worker.id } ) else { return }
        workers.remove(at: index)
    }
}
