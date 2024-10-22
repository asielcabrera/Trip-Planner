//
//  EmptyListView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera on 10/22/24.
//

import SwiftUI

struct EmptyListView: View {
    
    var tittle: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(tittle) will appear here")
                .font(.subheadline)
                .foregroundStyle(.tripPlannerBackground)
        }
    }
}

#Preview {
    EmptyListView(tittle: "Workers")
}
