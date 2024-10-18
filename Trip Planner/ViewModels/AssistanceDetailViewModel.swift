//
//  AssistanceDetailViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//


import Foundation
import SwiftUI

@Observable
class AssistanceDetailViewModel: ObservableObject {
    var passengers: [Passanger] = [] // Lista de pasajeros
    var day: Date = .now

    func fetchPassengers(for day: Date) {
        // Implementar lógica para filtrar pasajeros según el día (puedes usar el modelo de datos adecuado)
        passengers = [/* Cargar pasajeros para el día específico */]
    }

    func confirmAssistance(_ day: Date?, for passenger: Passanger) {
        // Implementar lógica para confirmar asistencia
        print("\(passenger.firstName) \(passenger.lastName) confirmed for \(day)")
    }

    func deletePassenger(at offsets: IndexSet) {
        passengers.remove(atOffsets: offsets) // Eliminar pasajero
    }
}
