//
//  OnBoardingView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    let totalPages = 3
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<totalPages, id: \.self) { page in
                    VStack {
                        Spacer()
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .padding(.bottom, 40)
                        Text("Onboarding Screen \(page + 1)")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .tag(page)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            HStack {
                if currentPage < totalPages - 1 {
                    Button("Skip") {
                        currentPage = totalPages - 1
                    }
                    Spacer()
                    Button("Next") {
                        currentPage += 1
                    }
                } else {
                    Button("Get Started") {
                        // Acción para finalizar el onboarding
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingView()
        .modelContainer(for: Item.self, inMemory: true)
}

