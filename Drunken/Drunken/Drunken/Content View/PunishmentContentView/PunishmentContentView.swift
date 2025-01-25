//
//  CommandContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import SwiftUI

struct PunishmentContentView: View {
    @StateObject var viewModel: PunishmentContentViewModel
    @Binding var isDismiss: Bool

    var body: some View {
        ZStack {
            AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.backgroundColor]))

            VStack {
                Button {
                    self.isDismiss = false
                } label: {
                    VStack(spacing: 30) {
                        Text("Your Card: \(DrunkenUtil().getCardNumberText(card: self.viewModel.getCard()))")
                            .font(.lazyDog30)

                        VStack(spacing: 20) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(Color.frontCardColor)

                                    VStack {
                                        HStack {
                                            Text(self.viewModel.getCard().first?.description ?? "")
                                                .font(.lazyDog80)
                                                .foregroundStyle(DrunkenUtil().getCardNumberColor(card: self.viewModel.getCard()))

                                            Spacer()
                                        }
                                        .padding(.top, 20)

                                        Spacer()

                                        Text(DrunkenUtil().getCardSuit(card: self.viewModel.getCard()))
                                            .font(.lazyDog80)

                                        Spacer()

                                        HStack {
                                            Spacer()

                                            Text(self.viewModel.getCard().first?.description ?? "")
                                                .font(.lazyDog80)
                                                .foregroundStyle(DrunkenUtil().getCardNumberColor(card: self.viewModel.getCard()))
                                        }
                                        .frame(alignment: .bottomTrailing)
                                    }
                                    .padding(.horizontal, 15)
                                }
                            }
                            .frame(width: 267, height: 400)

                            VStack(spacing: 10) {
                                Text("Description Punishment")
                                    .font(.lazyDog18)
                                    .foregroundStyle(Color.redColor)

                                Text(DrunkenUtil().getPunishment(card: self.viewModel.getCard()))
                                    .font(.notoSan18)
                            }
                        }
                    }
                }

                Spacer()
            }
            .padding(.top, 50)
            .tint(Color.textColor)

            Spacer()
        }
    }
}

#Preview {
    PunishmentContentView(viewModel: PunishmentContentViewModel(card: "0"), isDismiss: .constant(false))
}
