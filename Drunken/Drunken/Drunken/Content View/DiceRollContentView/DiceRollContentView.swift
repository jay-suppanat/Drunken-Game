//
//  DiceRollContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import SwiftUI

struct DiceRollContentView: View {
    @StateObject public var viewModel: DiceRollViewModel

    var body: some View {
        ZStack {
            AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))

            Text("Dice Roll")
        }
    }
}

#Preview {
    DiceRollContentView(viewModel: DiceRollViewModel())
}
