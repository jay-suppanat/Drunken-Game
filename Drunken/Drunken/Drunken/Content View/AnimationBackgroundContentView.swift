//
//  AnimationBackgroundContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 23/1/2568 BE.
//

import SwiftUI

struct AnimationBackgroundContentView: View {
    @State private var startPoint = UnitPoint.topLeading
    @State private var endPoint = UnitPoint.bottomTrailing

    public var colorArrays: [Color]

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: self.colorArrays),
            startPoint: startPoint,
            endPoint: endPoint
        )
        .ignoresSafeArea()
        .onAppear {
//            withAnimation(.interactiveSpring(duration: 3).repeatForever(autoreverses: false)) {
//                startPoint = .bottomTrailing
//                endPoint = .topLeading
//            }
        }
    }
}

#Preview {
    AnimationBackgroundContentView(colorArrays: [Color.blackColor])
}
