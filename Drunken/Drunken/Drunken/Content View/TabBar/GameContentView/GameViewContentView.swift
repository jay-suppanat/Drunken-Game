//
//  GameViewContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 19/1/2568 BE.
//

import SwiftUI

struct GameViewContentView: View {
    @State private var isOpen: Bool = false
    @State private var isShowCommand: Bool = false
    @StateObject private var cardManager: CardDeckManager = CardDeckManager()


    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()

                ZStack {
                    Image(systemName: "pencil.circle.fill")
                        .frame(height: 50)
                }
            }

            Spacer()

            HStack {
                ZStack {
                    Image(AssetsManager.backCard.rawValue)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(width: 200, height: 300)
                        .aspectRatio(contentMode: .fill)
                        .offset(y: self.isOpen ? UIScreen.main.bounds.height : 0)
                        .animation(.easeInOut(duration: 0.5), value: self.isOpen)

                    Button {
                        self.touchCardView()
                    } label: {
                        Image(AssetsManager.backCard.rawValue)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .frame(width: 200, height: 300)
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }
            .fullScreenCover(isPresented: $isShowCommand, onDismiss: {
                self.isOpen.toggle()
            }, content: {
                CommandContentView(cardNumber: self.cardManager.card,
                                   isDismiss: $isShowCommand)
                    .presentationBackground(Color.white.opacity(0.3))
            })

            Spacer()
        }
    }

    private func touchCardView() {
        self.isOpen.toggle()
        self.cardManager.randomCard()

        // Delay equal to animation duration
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isShowCommand.toggle()
        }
    }
}

#Preview {
    GameViewContentView()
}
