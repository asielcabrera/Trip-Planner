//
//  MapView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//


import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let points: [Point]
    @Binding var region: MKCoordinateRegion
    @Binding var polyline: MKPolyline?
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.setRegion(region, animated: true)
        
        // Remover cualquier overlay previo
        mapView.removeOverlays(mapView.overlays)
        
        // Añadir el nuevo polyline si existe
        if let polyline = polyline {
            mapView.addOverlay(polyline)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        // Función para renderizar el polyline
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 3
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}
