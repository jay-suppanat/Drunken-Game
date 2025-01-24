//
//  AnimationBackgroundContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 23/1/2568 BE.
//

import SwiftUI

struct AnimationBackgroundContentView: View {
    @StateObject var viewModel: AnimationBackgroundViewModel

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: self.viewModel.gredientColorsPublished),
            startPoint: self.viewModel.startingPointPublished,
            endPoint: self.viewModel.endingPointPublished
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
    AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))
}
