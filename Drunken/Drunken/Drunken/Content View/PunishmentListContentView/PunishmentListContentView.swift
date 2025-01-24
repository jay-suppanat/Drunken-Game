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

            VStack {
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
                    List(0 ..< self.viewModel.getPunishmentCount(), id: \.self) { index in
                        EditCommandCell(card: self.viewModel.getPunishmentTitleAtIndex(index),
                                        command: self.viewModel.getPunishmentAtIndex(index))
                            .listRowBackground(Color.darkGrayColor.opacity(0.5))
                    }
                    .setupListView()
                }
            }
            .padding(.horizontal)
        }
        .setupNavigationBar(title: Constants.Text.editCommand)
    }
}

// MARK: EditCommandCell

struct EditCommandCell: View {
    @State var card: String
    @State var command: String

    // Action
    @State var isShowEditCommandView: Bool = false

    var body: some View {
        Button {
            self.touchCell()
        } label: {
            Text("Card \(self.card)")
                .font(.subheadline)
                .frame(alignment: .leading)
                .tint(Color.textColor)
        }
        .fullScreenCover(isPresented: self.$isShowEditCommandView) {
        } content: {
            EditCommandAlert(card: self.card,
                             isShowEditCommandView: self.$isShowEditCommandView)
        }
    }

    private func touchCell() {
        self.isShowEditCommandView.toggle()
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
