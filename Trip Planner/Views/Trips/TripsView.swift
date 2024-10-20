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
    
    @Query var allTrips: [Trip]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.tripPlannerLigth.ignoresSafeArea()
                VStack(alignment: .leading) {
                    
                    Header
                    TittleView
                    
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
                }
                .padding()
            }
        }
    }
    
    
    var Header: some View {
        HStack {
            Button(action: { showMenu.toggle() }) {
                Image(systemName: showMenu ? "xmark" : "text.alignleft")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.tripPlannerDark)
                    .contentTransition(.symbolEffect)
            }
            
            Spacer()
            
            Button(action: {
                let trip = Trip(dateFor: .distantFuture, status: .pending, points: [])
                modelContext.insert(trip)
            }, label: {
                Circle()
                    .frame(width: 45, height: 45)
                    .foregroundStyle(Color.tripPlannerDarkBritness)
                    .overlay(content: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(Color.tripPlannerDark)
                    })
            })
        }
    }
    
    
    var EmptyListView: some View {
        VStack(alignment: .center) {
            Text("Trips will appear here")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    var TittleView: some View {
        VStack(alignment: .leading) {
            Text("Your Trips")
                .font(.system(size: 15))
                .foregroundStyle(Color.tripPlannerDark)
            Text("Trips")
                .font(.system(size: 40))
                .foregroundStyle(.secondary)
        }
        .padding(.top, 25)
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
    
    @ViewBuilder
    func CustomListRowView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        Rectangle()
            .fill(Color.tripPlannerLigth)
            .cornerRadius(25)
            .frame(height: 80)
            .overlay {
                content()
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
