//
//  GameViewContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 19/1/2568 BE.
//

import SwiftUI

struct GameViewContentView: View {
    @StateObject private var viewModel: GameViewModel = .init()
    @State private var isOpen: Bool = false
    @State private var isShowCommand: Bool = false
    @State private var isGoToEditView: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: Background Color
                AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.backgroundColor]))

                VStack(spacing: 175) {
                    HStack {
                        Button {
                            // Action open side menu
                        } label: {
                            Image(systemName: "list.bullet.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .tint(Color.whiteColor)
                        }

                        Spacer()

                        // MARK: Reset Button
                        Button {
                            self.viewModel.touchResetButton()
                        } label: {
                            Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .tint(Color.whiteColor)
                        }
                        .alert("Would you like to restart?", isPresented: self.$viewModel.isShowAlert) {
                            Button("Restart") {
                                self.viewModel.fillCard()
                            }

                            Button("Cancel", role: .cancel) {
                                self.viewModel.touchCancelAlertButton()
                            }
                        }

                        // MARK: Edit Command Button
                        ZStack {
                            Button {
                                self.isGoToEditView = true
                            } label: {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: !self.viewModel.isCanEditCommand ? 0 : 30, height: 30)
                                    .tint(self.viewModel.isCanEditCommand ? Color.whiteColor : Color.redColor)
                            }
                            .navigationDestination(isPresented: self.$isGoToEditView) {
                                PunishmentListContentView(viewModel: PunishmentListViewModel())
                            }
                            .onAppear {
                                self.isGoToEditView = false
                            }
                        }
                    }
                    .tint(Color.blackColor)
                    .padding(.horizontal)

                    HStack {
                        ZStack {
                            // MARK: Slide Card View
                            Image(AssetsManager.backCard.rawValue)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .frame(width: 200, height: 300)
                                .scaleEffect(1.5)
                                .aspectRatio(contentMode: .fill)
                                .offset(y: self.isOpen ? UIScreen.main.bounds.height : 0)
                                .animation(.easeInOut(duration: self.viewModel.getAnimationTime()), value: self.isOpen)

                            // MARK: Card View Button

                            Button {
                                self.touchCardView()
                            } label: {
                                Image(AssetsManager.backCard.rawValue)
                                    .resizable()
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .frame(width: 200, height: 300)
                                    .scaleEffect(1.5)
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
                        PunishmentContentView(viewModel: PunishmentContentViewModel(card: self.viewModel.card),
                                           isDismiss: self.$isShowCommand)
                    })
                    .alert("Would you like to restart the game?", isPresented: self.$viewModel.isGameEnd) {
                        Button("Restart") {
                            self.viewModel.fillCard()
                        }

                        Button("Cancel", role: .cancel) {
                            self.viewModel.touchCancelAlertButton()
                        }
                    }

                    Spacer()
                }
                .padding(.top, 20)
            }
            .toolbarVisibility(.hidden, for: .navigationBar)
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
        .background(Color.orange)
}
