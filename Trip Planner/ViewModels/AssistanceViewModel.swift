//
//  AssistanceViewModel.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import Foundation

@Observable
class AssistanceViewModel {
    var weekDays: [Date] = []

    func updateWeekDays(from selectedDate: Date) {
        let calendar = Calendar.current
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: selectedDate))!
        
        weekDays = (0..<4).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
}
