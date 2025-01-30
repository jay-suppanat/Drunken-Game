//
//  PunishmentListCell.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 30/1/2568 BE.
//

import SwiftUI

struct PunishmentListCell: View {
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
                .fill(Color.cellColor.opacity(1))

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
                            .tint(Color.yellowColor)

                        Spacer()

                        Image(systemName: "chevron.up")
                            .frame(width: 30, height: 30)
                            .rotationEffect(Angle(degrees: self.isShowEditField && self.environment.editPunishmentIndex == self.index ? 180 : 0))
                            .tint(Color.whiteColor)
                    }
                    .frame(height: 30)
                }

                if self.isShowEditField && self.environment.editPunishmentIndex == self.index {
                    VStack {
                        // MARK: Edit Punishment View
                        TextEditor(text: self.$command)
                            .frame(height: 100)
                            .background(Color.lightGrayColor)
                            .cornerRadius(10)
                            .font(.notoSan14)
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
                                    .foregroundStyle(Color.whiteColor)
                            }
                            .background(Color.redColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10))

                            // MARK: Submit
                            if self.command != DrunkenUtil().getPunishment(card: self.card) {
                                Button {
                                    withAnimation {
                                        self.touchSubmit()
                                    }
                                } label: {
                                    Text(Constants.Button.submit)
                                        .padding(5)
                                        .font(.lazyDog16)
                                        .foregroundStyle(Color.whiteColor)
                                }
                                .background(Color.greenColor)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                } else {
                    // MARK: Punsishment Text View
                    HStack {
                        Text(self.command)
                            .foregroundStyle(Color.whiteColor)
                            .multilineTextAlignment(.leading)
                            .font(.notoSan16)

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
        DrunkenUtil().setPunishment(card: self.card, newCommand: self.command)
    }

    private func touchCancel() {
        self.command = DrunkenUtil().getPunishment(card: self.card)
        self.isShowEditField = false
    }
}

#Preview {
    PunishmentListCell(index: 0, card: "", command: "")
}
