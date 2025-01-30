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
                    VStack(spacing: 20) {
                        Text("Your Card: \(DrunkenUtil().getCardNumberText(card: self.viewModel.getCard()))")
                            .font(.lazyDog30)

                        VStack(spacing: 20) {
                            CardContentView(viewModel: CardViewModel(side: .front, card: self.viewModel.getCard()))

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
