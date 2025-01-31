//
//  SettingContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import SwiftUI

struct SettingContentView: View {
    @StateObject public var viewModel: SettingViewModel

    var body: some View {
        ZStack {
            AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))

            VStack {
                ForEach(0..<self.viewModel.getSettingMenuListCount(), id: \.self) { index in
                    // Cell
                }
            }
        }
    }
}

#Preview {
    SettingContentView(viewModel: SettingViewModel())
}
