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
                    .alert(Constants.Text.gameEnd, isPresented: self.$isShowResetAlert) {
                        Button(Constants.Button.reset) {
                            self.viewModel.resetPunishment()
                            self.isShowResetAlert = false
                            self.isOpenEditPunishmentView.toggle()
                        }

                        Button(Constants.Button.cancel, role: .cancel) {
                            self.isShowResetAlert = true
                        }
                    } message: {
                        Text(Constants.Text.restartGameAlert)
                    }
                }

                // MARK: List Content

                if self.viewModel.getPunishmentCount() == self.viewModel.getPunishmentTitleCount() {
                    ScrollView {
                        ForEach(0 ..< self.viewModel.getPunishmentCount(), id: \.self) { index in
                            PunishmentListCell(index: index,
                                               card: self.viewModel.getPunishmentTitle(at: index),
                                               command: self.viewModel.getPunisment(at: index))
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
    PunishmentListContentView(viewModel: PunishmentListViewModel(), isOpenEditPunishmentView: .constant(false))
}
