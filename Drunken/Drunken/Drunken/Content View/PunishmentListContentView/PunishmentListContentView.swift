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
                        }

                        Button("Cancel", role: .cancel) {
                            self.isShowResetAlert = true
                        }
                    } message: {
                        Text("Would you like to reset all punishment?")
                    }
                }

                // MARK: List Content
                if self.viewModel.getPunishmentCount() == self.viewModel.getPunishmentTitleCount() {
                    ScrollView {
                        ForEach(0 ..< self.viewModel.getPunishmentCount(), id: \.self) { index in
                            EditCommandCell(index: index,
                                            card: self.viewModel.getPunishmentTitleAtIndex(index),
                                            command: .constant(self.viewModel.getPunishmentAtIndex(index)),
                                            editCommand: self.viewModel.getPunishmentAtIndex(index))
                                .listRowBackground(Color.darkGrayColor.opacity(0.5))
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .setupNavigationBar(title: Constants.Text.editCommand)
    }
}

// MARK: EditCommandCell

struct EditCommandCell: View {
    var index: Int
    @State var card: String
    @Binding var command: String
    @State var editCommand: String

    // Environment
    @EnvironmentObject private var environment: EnvironmentManager

    // Action
    @State var isShowEditCommandView: Bool = false
    @State var isShowEditField: Bool = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.whiteColor.opacity(0.5))

            VStack {
                // MARK: Expand Button Action
                Button {
                    withAnimation {
                        self.touchCell()
                    }
                } label: {
                    HStack {
                        Text("Card \(self.card)")
                            .font(Font.lazyDog16)
                            .frame(alignment: .leading)
                            .tint(Color.textColor)

                        Spacer()

                        Image(systemName: "chevron.up.circle.fill")
                            .frame(width: 30, height: 30)
                            .rotationEffect(Angle(degrees: self.isShowEditField && self.environment.editPunishmentIndex == self.index ? 180 : 0))
                            .tint(self.isShowEditField && self.environment.editPunishmentIndex == self.index ? Color.mintGreenColor : Color.lightRedColor)
                    }
                    .frame(height: 30)
                }

                if self.isShowEditField && self.environment.editPunishmentIndex == self.index {
                    VStack {
                        // MARK: Edit Punishment View
                        TextEditor(text: self.$editCommand)
                            .frame(height: 100)
                            .background(Color.whiteColor)
                            .cornerRadius(10)
                            .foregroundStyle(Color.blackColor)
                            .scrollContentBackground(.hidden)
                            .animation(.easeInOut, value: self.isShowEditField && self.environment.editPunishmentIndex == self.index)

                        HStack {
                            Spacer()

                            // MARK: Cancel
                            Button {
                                withAnimation {
                                    self.touchCancel()
                                }
                            } label: {
                                Text(Constants.Button.cancel)
                                    .padding(5)
                                    .font(.lazyDog16)
                                    .foregroundStyle(Color.blackColor)
                            }
                            .background(Color.redColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                            // MARK: Submit
                            if self.editCommand != DrunkenUtil().getPunishment(card: self.card) {
                                Button {
                                    withAnimation {
                                        self.touchSubmit()
                                    }
                                } label: {
                                    Text(Constants.Button.submit)
                                        .padding(5)
                                        .font(.lazyDog16)
                                        .foregroundStyle(Color.blackColor)
                                }
                                .background(Color.greenColor)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                } else {
                    HStack {
                        Text(self.command)
                            .foregroundStyle(Color.whiteColor)
                            .multilineTextAlignment(.leading)

                        Spacer()
                    }
                }
            }
            .padding(10)
        }
    }

    private func touchCell() {
        if self.environment.editPunishmentIndex == self.index {
            self.isShowEditField.toggle()
        } else {
            self.isShowEditField = true
            self.environment.editPunishmentIndex = self.index
        }
    }

    private func touchSubmit() {
        self.isShowEditField = false
        DrunkenUtil().setPunishment(card: self.card, newCommand: self.editCommand)
        self.command = self.editCommand
    }

    private func touchCancel() {
        self.editCommand = DrunkenUtil().getPunishment(card: self.card)
        self.isShowEditField = false
    }
}

#Preview {
//    EditCommandContentView(viewModel: EditCommandViewModel())
}
