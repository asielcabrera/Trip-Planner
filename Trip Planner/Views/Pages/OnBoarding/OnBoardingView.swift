//
//  OnBoardingView.swift
//  Trip Planner
//
//  Created by Asiel Cabrera Gonzalez on 10/17/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var activePage: Page = .page1
    @Environment(\.onBoardingContext) var onBoardingContext
    var body: some View {
        GeometryReader {
            let size = $0.size
            VStack {
                Spacer(minLength: 0)
                MorphingSymbolView(
                    symbol: activePage.rawValue,
                    config: .init(
                        font: .system(size: 150, weight: .bold),
                        frame: .init(width: 250, height: 200),
                        radius: 30,
                        foregroundColor: .tripPlannerBackground
                    ),
                    displayingSymbol: activePage.rawValue
                )
                
                TextContent(size: size)
                
                Spacer(minLength: 0)
                
                IndicatiorView()
                
                ContinueButton()
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .top) {
                HeaderView()
            }
        }
        .background {
            Rectangle()
                .fill(.tripPlannerLigth.gradient)
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func TextContent(size: CGSize) -> some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 0 ){
                ForEach(Page.allCases, id: \.rawValue) { page in
                    Text(page.title)
                        .lineLimit(1)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .kerning(1.1)
                        .frame(width: size.width)
                        .foregroundStyle(.tripPlannerBackground)
                }
            }
            .offset(x: -activePage.index * size.width)
            .animation(.smooth(duration: 0.7, extraBounce: 0.1), value: activePage)
            
            HStack(alignment: .top, spacing: 0 ){
                ForEach(Page.allCases, id: \.rawValue) { page in
                    Text(page.subTitle)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .kerning(1.1)
                        .frame(width: size.width)
                        .foregroundStyle(.tripPlannerDark)
                }
            }
            .offset(x: -activePage.index * size.width)
            .animation(.smooth(duration: 0.9, extraBounce: 0.1), value: activePage)
        }
        .padding(.top, 15)
        .frame(width: size.width, alignment: .leading)
    }
    
    @ViewBuilder
    func IndicatiorView() -> some View {
        HStack(spacing: 6) {
            ForEach(Page.allCases, id: \.rawValue) { page in
                Capsule()
                    .fill(.tripPlannerBackground.opacity(activePage == page ? 1 : 0.4))
                    .frame(width: activePage == page ? 25 : 8, height: 8)
            }
        }
        .animation(.smooth(duration: 0.5, extraBounce: 0), value: activePage)
        .padding(.bottom, 12)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Button {
                activePage = activePage.previousPage
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .contentShape(.rect)
                    .foregroundStyle(.tripPlannerBackground)
            }
            .opacity(activePage != .page1 ? 1 : 0)
            
            Spacer(minLength: 0)
            Button("Skip") {
                activePage = .page4
            }
            .fontWeight(.semibold)
            .opacity(activePage != .page4 ? 1 : 0)
            .foregroundStyle(.tripPlannerBackground)
        }
        .animation(.smooth(duration: 0.35, extraBounce: 0), value: activePage)
        .padding(15)
    }
    
    @ViewBuilder
    func ContinueButton() -> some View {
        Button {
            if activePage.hasNextPage {
                activePage = activePage.nextPage
            } else {
                withAnimation(.smooth(duration: 0.5, extraBounce: 0)) {
                    onBoardingContext.completeOnboarding()
                }
            }
        } label: {
            Text(activePage == .page4 ? "Login into TravelPlanner App" : "Continue")
                .contentTransition(.identity)
                .foregroundStyle(.white)
                .padding(.vertical, 15)
                .frame(maxWidth: activePage == .page4 ? 220 : 180)
                .background(.tripPlannerBackground, in: .capsule)
        }
        .padding(.bottom, 15)
        .animation(.smooth(duration: 0.5, extraBounce: 0), value: activePage)
    }
}



struct MorphingSymbolView: View {
    var symbol: String
    var config: Config
    
    @State private var trigger: Bool = false
    @State var displayingSymbol: String = ""
    @State private var nextSymbol: String = ""
    
    var body: some View {
        Canvas { ctx, size in
            ctx.addFilter(.alphaThreshold(min: 0.4, color: config.foregroundColor))
            
            if let renderedImage = ctx.resolveSymbol(id: 0) {
                ctx.draw(renderedImage, at: CGPoint(x: size.width / 2, y: size.height / 2))
            }
        } symbols: {
            ImageView()
                .tag(0)
        }
        .frame(width: config.frame.width, height: config.frame.height)
        .onChange(of: symbol) { oldValue, newValue in
            trigger.toggle()
            nextSymbol = newValue
        }
        .task {
            guard displayingSymbol == "" else { return }
            displayingSymbol = symbol
        }
    }
    
    
    @ViewBuilder
    func ImageView() -> some View {
        KeyframeAnimator(initialValue: CGFloat.zero, trigger: trigger) { radius  in
            Image(systemName: displayingSymbol)
                .font(config.font)
                .blur(radius: radius)
                .frame(width: config.frame.width, height: config.frame.height)
                .onChange(of: radius) { oldValue, newValue in
                    if newValue.rounded() == config.radius {
                        withAnimation(config.symbolAnimation) {
                            displayingSymbol = nextSymbol
                        }
                    }
                }
        } keyframes: { _ in
            CubicKeyframe(config.radius, duration: config.keyFrameDuration)
            CubicKeyframe(0, duration: config.keyFrameDuration)
        }
    }
    
    
    struct Config {
        var font: Font
        var frame: CGSize
        var radius: CGFloat
        var foregroundColor: Color
        var keyFrameDuration: CGFloat = 0.4
        var symbolAnimation: Animation = .smooth(duration: 0.5, extraBounce: 0)
    }
}








#Preview {
    OnboardingView()
        
}

//VStack {
//    TabView(selection: $currentPage) {
//        ForEach(0..<totalPages, id: \.self) { page in
//            VStack {
//                Spacer()
//                Image(systemName: "star.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 200, height: 200)
//                    .padding(.bottom, 40)
//                Text("Onboarding Screen \(page + 1)")
//                    .font(.title)
//                    .fontWeight(.bold)
//                Spacer()
//            }
//            .tag(page)
//        }
//    }
//    .tabViewStyle(PageTabViewStyle())
//    
//    HStack {
//        if currentPage < totalPages - 1 {
//            Spacer(minLength: 0)
//            Button("Skip") {
//                currentPage = totalPages - 1
//            }
//            Spacer()
//            Button("Next") {
//                currentPage += 1
//            }
//            Spacer(minLength: 0)
//        } else {
//            Button("Get Started") {
//                // Acción para finalizar el onboarding
//            }
//        }
//    }
//    .padding()
//}
