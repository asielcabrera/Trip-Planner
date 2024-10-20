//
//  CustomListRowView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/20/24.
//

import SwiftUI

struct CustomListRowView<Content: View>: View {
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        Rectangle()
            .fill(.ultraThinMaterial)
            .cornerRadius(25)
            .frame(height: 80)
            .overlay {
                content()
            }
    }
}
