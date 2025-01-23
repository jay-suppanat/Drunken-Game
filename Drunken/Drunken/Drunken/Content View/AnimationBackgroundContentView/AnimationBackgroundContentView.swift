//
//  AnimationBackgroundContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 23/1/2568 BE.
//

import SwiftUI

struct AnimationBackgroundContentView: View {
    @StateObject private var viewModel: AnimationBackgroundViewModel

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: self.viewModel.getColorArray()),
            startPoint: self.viewModel.getStartingPoint(),
            endPoint: self.viewModel.getEndingPoint()
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
