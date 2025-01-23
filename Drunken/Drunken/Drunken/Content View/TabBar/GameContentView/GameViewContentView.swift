//
//  GameViewContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 19/1/2568 BE.
//

import SwiftUI

struct GameViewContentView: View {
    @StateObject private var viewModel: GameContentViewModel = .init()
    @State private var isOpen: Bool = false
    @State private var isShowCommand: Bool = false
    @State private var isGoToEditView: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: Background Color
                Color.backgroundColor
                    .ignoresSafeArea()

                VStack(spacing: 130) {
                    HStack {

                        Button {
                            // Action open side menu
                        } label: {
                            Image(systemName: "list.bullet.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }

                        Spacer()

                        // MARK: Reset Button
                        Button {
                            self.viewModel.touchResetButton()
                        } label: {
                            Image(systemName: "repeat.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
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

                        // MARK: Edit Command Button
                        ZStack {
                            Button {
                                self.isGoToEditView = true
                            } label: {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .tint(self.viewModel.isCanEditCommand ? Color.blackColor : Color.redColor)
                            }
                            .navigationDestination(isPresented: self.$isGoToEditView) {
                                EditCommandContentView(viewModel: EditCommandViewModel())
                            }
                            .onAppear {
                                self.isGoToEditView = false
                            }

                            if !self.viewModel.isCanEditCommand {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: 30, height: 30)
                            } else {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: 30, height: 30)
                                    .hidden()
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
