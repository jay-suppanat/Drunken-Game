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
        NavigationView {
            VStack(spacing: 130) {
                HStack {
                    Spacer()

                    Button {
                        self.viewModel.touchResetButton()
                    } label: {
                        Image(systemName: "repeat.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(Color.blackColor)
                    }
                    .alert("Game End", isPresented: self.$viewModel.isShowAlert) {
                        Button("Restart") {
                            self.viewModel.fillCard()
                        }

                        Button("Cancel", role: .cancel) {
                            self.viewModel.touchCancelAlertButton()
                        }
                    } message: {
                        Text("Would you like to restart?")
                    }

                    Button {} label: {
                        NavigationLink {
                            EditCommandContentView(viewModel: EditCommandViewModel())
                        } label: {
                            Image(systemName: "pencil.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .tint(Color.blackColor)
                        }
                    }
                    .disabled(!self.viewModel.isCanEditCommand)
                }
                .padding(.horizontal)

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
                        .disabled(self.isOpen)
                    }
                }
                .fullScreenCover(isPresented: self.$isShowCommand, onDismiss: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.viewModel.getAnimationTime()) {
                        self.isOpen.toggle()
                    }
                }, content: {
                    CommandContentView(viewModel: CommandContentViewModel(card: self.viewModel.card),
                                       isDismiss: self.$isShowCommand)
                })
                .alert("Game End", isPresented: self.$viewModel.isShowAlert) {
                    Button("Restart") {
                        self.viewModel.fillCard()
                    }

                    Button("Cancel", role: .cancel) {
                        self.viewModel.touchCancelAlertButton()
                    }
                } message: {
                    Text("Would you like to restart?")
                }

                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
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
        .background(Color.orange)
}
