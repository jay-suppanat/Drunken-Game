//
//  CardContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 30/1/2568 BE.
//

import SwiftUI

struct CardContentView: View {
    @StateObject public var viewModel: CardViewModel

    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.frontCardColor)

                switch self.viewModel.getCardSide() {
                case .front:
                    VStack {
                        // MARK: Card Number
                        HStack {
                            Text(self.viewModel.getCard().first?.description ?? "")
                                .font(.lazyDog80)
                                .foregroundStyle(DrunkenUtil().getCardNumberColor(card: self.viewModel.getCard()))

                            Spacer()
                        }
                        .padding(.top, 20)

                        Spacer()

                        // MARK: Card Suit
                        Text(DrunkenUtil().getCardSuit(card: self.viewModel.getCard()))
                            .font(.lazyDog80)

                        Spacer()

                        // MARK: Card Number
                        HStack {
                            Spacer()

                            Text(self.viewModel.getCard().first?.description ?? "")
                                .font(.lazyDog80)
                                .foregroundStyle(DrunkenUtil().getCardNumberColor(card: self.viewModel.getCard()))
                        }
                        .frame(alignment: .bottomTrailing)
                    }
                    .padding(.horizontal, 15)
                case .back:
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.redColor)
                        .padding(30)

                    Text("Press to\nrandom card")
                        .multilineTextAlignment(.center)
                        .font(.lazyDog25)
                        .foregroundStyle(Color.yellowColor)
                }
            }
        }
        .frame(width: 320, height: 450)
    }
}

#Preview {
    CardContentView(viewModel: CardViewModel(side: .front, card: ""))
}
