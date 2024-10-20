//
//  SideBarActionButton.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/20/24.
//

import SwiftUI

struct SideBarActionButton: View {
    let value: SideBarAction
    let action: () -> ()
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: value.symbolImage)
                    .font(.title3)
                
                Text(value.rawValue)
                    .fontWeight(.semibold)
                
                Spacer(minLength: 0)
            }
            .foregroundStyle(Color.tripPlannerLigth)
            .padding(.vertical, 10)
            .contentShape(.rect)
        }
    }
}
