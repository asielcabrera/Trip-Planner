//
//  WorkerContext.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import SwiftUI

@Observable
public final class WorkerContext {
    
    public var workers: [Worker.Input] = []
    
    public func addWorker(firstName: String, lastName: String, email: String, role: Role) {
       let worker = Worker.Input(id: .init(), firstName: firstName, lastName: lastName, email: email, role: role)
        workers.append(worker)
    }
    
    public func deleteWorker(_ worker: Worker.Input) {
        guard let index = workers.firstIndex(where: { $0.id == worker.id } ) else { return }
        workers.remove(at: index)
    }
}
