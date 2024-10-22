//
//  ActiveTripGPSViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//


import Foundation
import MapKit

@Observable
class ActiveTripGPSViewModel {
    var passengers: [Passanger.Input] = [] // Lista de pasajeros a recoger
    var waypoints: [Point] = [] // Waypoints para el mapa
    var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    func fetchPassengers() {
        // Implementar lógica para cargar pasajeros a recoger
        // Esta lógica debe llenar la lista de passengers y waypoints
        // Ejemplo:
        passengers = [/* Cargar pasajeros desde tu modelo de datos */]
        waypoints = passengers.map { _ in Point(latitude: 0.0, longitude: 0.0) }
    }

    func setupPath() {
        // Aquí puedes configurar el camino (path) basado en los waypoints
        if let first = waypoints.first {
            region.center = CLLocationCoordinate2D(latitude: first.latitude, longitude: first.longitude)
        }
    }

    func confirmPickup(for passenger: Passanger.Input) {
        // Implementar lógica para confirmar la recogida del pasajero
        print("Confirmed pickup for \(passenger.firstName) \(passenger.lastName)")
        // Podrías eliminar el pasajero de la lista o marcarlo como recogido
        if let index = passengers.firstIndex(where: { $0.id == passenger.id }) {
            passengers.remove(at: index)
        }
    }

    func reportNotThere(for passenger: Passanger.Input) {
        // Implementar lógica para reportar que el pasajero no estuvo en la dirección
        print("\(passenger.firstName) \(passenger.lastName) was not at the specified address.")
        // Podrías manejar esto según tu lógica de negocio
    }

    var waypointsCoordinates: [CLLocationCoordinate2D] {
        return waypoints.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) }
    }
}
