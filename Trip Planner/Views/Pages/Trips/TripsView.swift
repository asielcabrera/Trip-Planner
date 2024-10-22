//
//  TripsView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI


struct TripsView: View {
    var viewModel: TripsViewModel { .init() }
    @State private var showingAddTripView = false
    @Binding var showMenu: Bool
     
    var body: some View {
        BaseLayoutView(
            tittle: "Trips",
            showPlusButtonAction: false,
            showMenu: $showMenu,
            content: {
                if viewModel.trips.isEmpty {
                    
                Spacer()
                    
                HStack(alignment: .center) {
                    Spacer()
                    EmptyListView
                        .padding()
                    Spacer()
                }
                    
                Spacer()
                    
            } else {
                TripListView
                    .padding(.vertical)
            }
        })
    }
    
    var EmptyListView: some View {
        VStack(alignment: .center) {
            Text("Trips will appear here")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    var TripListView: some View {
        ScrollView {
            ForEach(viewModel.trips) { trip in
                TripListRowView(trip: trip)
            }
            .onDelete(perform: viewModel.deleteTrip)
        }
        .scrollIndicators(.hidden)
    }
    
    
    @ViewBuilder
    func TripListRowView(trip: Trip.Input) -> some View {
        CustomListRowView {
            HStack {
                VStack(alignment: .leading) {
                    Text(dateFormatter.string(from: trip.dateFor))
                        .font(.title3)
                        .foregroundStyle(.white)
                    Text(trip.status.rawValue)
                        .font(.caption2)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                VStack {
                    Text("\(trip.points.count)")
                        .foregroundStyle(Color.tripPlannerDark)
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    ContentView()
}
