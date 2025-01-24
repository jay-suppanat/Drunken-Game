//
//  SettingContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

struct SettingContentView: View {
    @StateObject var viewModel: SettingContentViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: Background View
                AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))

                VStack {
                    //MARK: List View
                    List {
                        ForEach(0 ..< self.viewModel.getSettingMenuListCount(), id: \.self) { index in
                            SettingCellView(data: self.viewModel.getSettingManuListAtIndex(index))
                                .padding(.horizontal)
                                .listRowBackground(Color.darkGrayColor)
                                .frame(height: 36)
                        }
                    }
                    .setupListView()
                    .scrollDisabled(true)
                }
            }
        }
    }
}

// MARK: SettingCellView

struct SettingCellView: View {
    var data: SettingMenuElement

    var body: some View {
        ZStack {
            HStack {
                Image(systemName: self.data.image)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .tint(Color.whiteColor)

                Text(self.data.title)
                    .foregroundStyle(self.data.id == 1 ? Color.redColor : Color.blackColor)

                Spacer()
            }
        }
    }
}

#Preview {
    SettingContentView(viewModel: SettingContentViewModel())
}
