//
//  EditCommandContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import SwiftUI

// MARK: EditCommandContentView

struct PunishmentListContentView: View {
    @StateObject var viewModel: PunishmentListViewModel

    // Action
    @State private var isShowResetAlert: Bool = false
    @Binding public var isOpenEditPunishmentView: Bool

    var body: some View {
        ZStack {
            // MARK: Background View

            AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.backgroundColor]))

            VStack(spacing: 10) {
                // MARK: Reset Button

                HStack {
                    Spacer()

                    Button {
                        self.isShowResetAlert.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.counterclockwise.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .trailing)
                                .tint(Color.white)
                        }
                    }
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .alert("Game End", isPresented: self.$isShowResetAlert) {
                        Button("Reset") {
                            self.viewModel.resetPunishment()
                            self.isShowResetAlert = false
                            self.isOpenEditPunishmentView.toggle()
                        }

                        Button("Cancel", role: .cancel) {
                            self.isShowResetAlert = true
                        }
                    } message: {
                        Text("Would you like to reset all punishment?")
                    }
                }

                // MARK: List Content

                if self.viewModel.commandListPublished.count == self.viewModel.commandTitleListPublished.count {
                    ScrollView {
                        ForEach(0 ..< self.viewModel.commandListPublished.count, id: \.self) { index in
                            PunishmentListCell(index: index,
                                               card: self.viewModel.commandTitleListPublished[index],
                                               command: self.viewModel.commandListPublished[index].punishment)
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .padding(.horizontal)
        }
        .setupNavigationBar(title: Constants.Text.editCommand)
    }
}

#Preview {
//    EditCommandContentView(viewModel: EditCommandViewModel())
}
