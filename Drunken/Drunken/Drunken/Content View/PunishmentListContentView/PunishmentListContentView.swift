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
                                            command: self.viewModel.getPunishmentAtIndex(index))
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
    @State var command: String

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
                    }
                    .padding(10)
                }

                if self.isShowEditField && self.environment.editPunishmentIndex == self.index {
                    // MARK: Edit Punishment View

                    VStack {
                        TextEditor(text: self.$command)
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
                                // Dismiss
                            } label: {
                                Text(Constants.Button.cancel)
                                    .padding(5)
                                    .font(.lazyDog16)
                                    .foregroundStyle(Color.blackColor)
                            }
                            .background(Color.redColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                            // MARK: Submit
                            Button {
                                // Save
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
                    .padding(.horizontal, 10)
                }
            }
            .padding(5)
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
}

// MARK: EditCommandAlert

struct EditCommandAlert: View {
    @State var card: String
    @Binding var isShowEditCommandView: Bool
    @State var newCommand: String = ""

    var body: some View {
        ZStack {
            Color.blackColor
                .ignoresSafeArea()

            VStack(spacing: 30) {

                // MARK: Punishment Text
                Text(DrunkenUtil().getPunishment(card: self.card))
                    .frame(alignment: .center)
                    .foregroundStyle(Color.whiteColor)

                // MARK: Text Editor
                TextEditor(text: self.$newCommand)
                    .frame(height: 150)
                    .background(Color.darkGrayColor)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                    .foregroundStyle(Color.whiteColor)
                    .scrollContentBackground(.hidden)

                HStack(spacing: 50) {
                    Spacer()

                    // MARK: Cancel Button
                    Button {
                        self.touchCancel()
                    } label: {
                        Text(Constants.Button.cancel)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .tint(Color.textColor)
                    }
                    .background(Color.redColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                    // MARK: Submit Button
                    Button {
                        self.touchSubmit()
                    } label: {
                        Text(Constants.Button.submit)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .tint(Color.textColor)
                    }
                    .background(Color.greenColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .disabled(!self.checkIsChangeCommand())

                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }

    private func touchCancel() {
        self.isShowEditCommandView = false
    }

    private func touchSubmit() {
        DrunkenUtil().setPunishment(card: self.card, newCommand: self.newCommand)
        self.isShowEditCommandView = false
    }

    private func checkIsChangeCommand() -> Bool {
        return !self.newCommand.isEmpty
    }
}

#Preview {
//    EditCommandContentView(viewModel: EditCommandViewModel())
}
