//
//  BaseLayoutView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/20/24.
//

import SwiftUI

struct BaseLayoutView<Content: View>: View  {
    
    var tittle: String = ""
    var showPlusButtonAction: Bool = true
    var showTittleView: Bool = true
    var plusButtonAction: () -> Void = { }
    
    @Binding var showMenu: Bool
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.tripPlannerLigth.ignoresSafeArea()
                VStack(alignment: .leading) {
                    Header
                    if showTittleView {
                        TittleView
                    }
                    content()
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
                    .foregroundColor(.tripPlannerDark)
                    .contentTransition(.symbolEffect)
            }
            
            Spacer()
            
            if showPlusButtonAction {
                Button(action: {
                    plusButtonAction()
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
    }
    
    var TittleView: some View {
        VStack(alignment: .leading) {
            Text("Your \(tittle)")
                .font(.system(size: 15))
                .foregroundStyle(.tripPlannerBackground.opacity(0.9))
            Text("\(tittle)")
                .font(.system(size: 40))
                .foregroundStyle(.tripPlannerBackground)
        }
        .padding(.top, 25)
    }
}
