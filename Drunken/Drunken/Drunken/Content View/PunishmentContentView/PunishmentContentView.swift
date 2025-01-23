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
                        Text("Your Card: \(DrunkenUtil().getCardNumberText(card: self.viewModel.card))")
                            .font(.system(size: 30, weight: .bold))

                        VStack(spacing: 20) {
                            Image(self.viewModel.card)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .frame(width: 267, height: 400)
                                .aspectRatio(contentMode: .fill)

                            VStack(spacing: 10) {
                                Text("Description Punishment")
                                    .font(.system(size: 16, weight: .bold))

                                Text(DrunkenUtil().getPunishment(card: self.viewModel.card))
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(alignment: .leading)
                            }
                        }
                    }
                }
            }
            .tint(Color.textColor)

            Spacer()
        }
    }
}

#Preview {
//    CommandContentView(cardNumber: "2")
}
