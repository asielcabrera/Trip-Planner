//
//  ActiveTripGPSView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//


import SwiftUI
import MapKit
import SwiftData


//struct ActiveTripGPSView: View {
//    @Bindable private var viewModel = ActiveTripGPSViewModel()
//
//    var body: some View {
//        VStack {
//            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, userTrackingMode: .follow) { _ in
//                ForEach(viewModel.waypoints) { point in
//                    MapPin(coordinate: CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longitude), tint: .blue)
//                }
//
//                // Muestra el path
//                MapPolyline(coordinates: viewModel.waypointsCoordinates, strokeColor: .blue, lineWidth: 2)
//            }
//            .frame(height: 300)
//            .onAppear {
//                viewModel.setupPath()
//            }
//
//            List {
//                ForEach(viewModel.passengers, id: \.id) { passenger in
//                    HStack {
//                        Text("\(passenger.firstName) \(passenger.lastName)")
//                        Spacer()
//                        Button(action: {
//                            viewModel.confirmPickup(for: passenger)
//                        }) {
//                            Text("Picked Up")
//                                .foregroundColor(.green)
//                        }
//                        Button(action: {
//                            viewModel.reportNotThere(for: passenger)
//                        }) {
//                            Text("Not There")
//                                .foregroundColor(.red)
//                        }
//                    }
//                }
//            }
//        }
//        .navigationBarTitle("Active Trip", displayMode: .inline)
//        .onAppear {
//            viewModel.fetchPassengers() // Cargar pasajeros al iniciar la vista
//        }
//    }
//}
