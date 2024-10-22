//
//  AssistanceView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI
import SwiftData

struct AssistanceView: View {
    private var viewModel = AssistanceViewModel()
    @State private var selectedDate = Date()

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Select Week", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()

                List(viewModel.weekDays, id: \.self) { day in
                    NavigationLink(destination: AssistanceDetailView(day: day)) {
                        Text(day, style: .date) // Muestra el día en formato de fecha
                    }
                }
            }
            .navigationBarTitle("Assistance", displayMode: .inline)
            .onChange(of: selectedDate) { newDate in
                viewModel.updateWeekDays(from: newDate) // Actualiza los días de la semana
            }
            .onAppear {
                viewModel.updateWeekDays(from: selectedDate) // Inicializa los días de la semana
            }
        }
    }
}


struct AssistanceDetailView: View {
    var viewModel = AssistanceDetailViewModel()
    @State var showAddPassenger = false
    var day: Date // Recibe el día seleccionado

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.passengers, id: \.id) { passenger in
                    HStack {
                        Text("\(passenger.firstName) \(passenger.lastName)")
                        Spacer()
                        Button(action: {
                            viewModel.confirmAssistance(nil, for: passenger) // Confirmar asistencia
                        }) {
                            Text("Confirm")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .onDelete(perform: viewModel.deletePassenger) // Eliminar pasajero con swipe
            }
            .navigationBarTitle("\(viewModel.day)", displayMode: .inline)

            Button(action: {
                // Lógica para agregar un nuevo pasajero
                showAddPassenger = true
            }) {
                Text("Add Passenger")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $showAddPassenger) {
            AddPassengerView(viewModel: viewModel) // Vista para agregar un nuevo pasajero
        }
        .onAppear {
            viewModel.fetchPassengers(for: day) // Obtener pasajeros para el día seleccionado
        }
    }
}

struct AddPassengerView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AssistanceDetailViewModel

    @State private var firstName: String = ""
    @State private var lastName: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)

                Button(action: {
                    let newPassenger = Passanger.Input(id: .init(), firstName: firstName, lastName: lastName, address: "")
                    // Aquí se podría agregar a la lista de pasajeros
                    viewModel.passengers.append(newPassenger)
                    presentationMode.wrappedValue.dismiss() // Cerrar vista
                }) {
                    Text("Add Passenger")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Add Passenger", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
