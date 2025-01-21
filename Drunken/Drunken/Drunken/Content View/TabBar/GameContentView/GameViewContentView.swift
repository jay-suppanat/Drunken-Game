//
//  GameViewContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 19/1/2568 BE.
//

import SwiftUI

struct GameViewContentView: View {
    @StateObject private var viewModel: GameContentViewModel = GameContentViewModel()
    @State private var isOpen: Bool = false
    @State private var isShowCommand: Bool = false

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
                        .animation(.easeInOut(duration: self.viewModel.getAnimationTime()), value: self.isOpen)

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
                CommandContentView(viewModel: CommandContentViewModel(card: self.viewModel.card),
                                   isDismiss: $isShowCommand)
            })

            Spacer()
        }
    }

    private func touchCardView() {
        self.isOpen.toggle()
        self.viewModel.randomCard()

        // Delay equal to animation duration
        DispatchQueue.main.asyncAfter(deadline: .now() + self.viewModel.getAnimationTime()) {
            self.isShowCommand.toggle()
        }
    }
}

#Preview {
    GameViewContentView()
}
