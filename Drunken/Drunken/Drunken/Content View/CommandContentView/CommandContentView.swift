//
//  CommandContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 21/1/2568 BE.
//

import SwiftUI

struct CommandContentView: View {
    @StateObject var viewModel: CommandContentViewModel
    @Binding var isDismiss: Bool

    var body: some View {
        ZStack {
            VStack {
                Spacer()

                Button {
                    self.isDismiss = false
                } label: {
                    VStack {
                        Image(self.viewModel.card)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .frame(width: 267, height: 400)
                            .aspectRatio(contentMode: .fill)

                        Text("Your Card: \(DrunkenUtil().getCardNumberText(card: self.viewModel.card))")
                            .font(.system(size: 16, weight: .bold, design: .serif))

                        VStack(spacing: 10) {
                            Text("Description Punishment")
                                .font(.system(size: 16, weight: .bold, design: .serif))

                            Text(DrunkenUtil().getPunishment(card: self.viewModel.card))
                                .font(.system(size: 16, weight: .medium, design: .serif))
                                .frame(alignment: .leading)
                        }
                    }
                }

                Spacer()
            }
        }
    }
}

#Preview {
//    CommandContentView(cardNumber: "2")
}
