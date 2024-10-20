//
//  TripsView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI
import SwiftData

struct TripsView: View {

    @State private var showingAddTripView = false
    @Binding var showMenu: Bool
    
    @Query var allTrips: [Trip] = []
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        BaseLayoutView(
            tittle: "Trips",
            showPlusButtonAction: false,
            showMenu: $showMenu,
            content: {
            if allTrips.isEmpty {
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
            ForEach(allTrips) { trip in
                TripListRowView(trip: trip)
            }
            .onDelete(perform: deleteTrip)
        }
        .swipeActions(content: {
            
        })
        .scrollIndicators(.hidden)
    }
    
    func deleteTrip(_ indexSet: IndexSet) {
        for index in indexSet {
            let trip = allTrips[index]
            modelContext.delete(trip)
        }
    }
    
    @ViewBuilder
    func TripListRowView(trip: Trip) -> some View {
        CustomListRowView {
            HStack {
                VStack(alignment: .leading) {
                    Text(trip.dateFor.description)
                        .font(.title3)
                        .foregroundStyle(.black)
                    Text(trip.status.rawValue)
                        .font(.caption2)
                        .foregroundStyle(Color.tripPlannerDark)
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
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try  ModelContainer(for: Trip.self, configurations: config)
    return HomeView()
            .modelContainer(container)
    }
    catch {
        fatalError("Unable to create model container: \(error)")
    }
}
