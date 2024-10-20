//
//  SideBarMenu.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/20/24.
//

import SwiftUI

struct SideBarMenu: View {
    
    let safeArea: UIEdgeInsets
    @Binding var selectedAction: SideBarAction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Trip Planner")
                .font(.title.bold())
                .foregroundStyle(.white)
                .padding(.bottom, 10)
            
            ForEach(SideBarAction.primary, id: \.rawValue) { action in
                SideBarActionButton(value: action) {
                    selectedAction = action
                }
            }
            
            Spacer()
            
            ForEach(SideBarAction.secondary, id: \.rawValue) { action in
                SideBarActionButton(value: action){
                    selectedAction = action
                }
                
            }
            
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 20)
        .padding(.top, safeArea.top)
        .padding(.bottom, safeArea.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}


