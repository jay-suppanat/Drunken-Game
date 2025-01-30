//
//  GameViewContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 19/1/2568 BE.
//

import SwiftUI
import GoogleMobileAds

struct DoraemonGameContentView: View {
    @StateObject private var viewModel: DoraemonGameViewModel = .init()

    // Environment
    @EnvironmentObject private var appEnvironment: EnvironmentManager

    // Action State
    @State private var isShowPunishment: Bool = false
    @State private var isOpenCard: Bool = false
    @State private var isOpenEditPunishmentView: Bool = false
    @State private var isOpenSideMenu: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: Background Color
                AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.backgroundColor]))

                VStack {
                    HStack(spacing: self.viewModel.isCanEditCommand ? 10 : 0) {
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
                        .alert(Constants.Text.alert, isPresented: self.$viewModel.isShowAlert) {
                            Button(Constants.Button.restart) {
                                self.viewModel.fillCard()
                            }

                            Button(Constants.Button.cancel, role: .cancel) {
                                self.viewModel.touchCancelAlertButton()
                            }
                        } message : {
                            Text(Constants.Text.restartGameAlert)
                        }

                        // MARK: Edit Command Button
                        ZStack {
                            Button {
                                self.appEnvironment.isShowMenuList = false
                                self.isOpenEditPunishmentView = true
                            } label: {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: !self.viewModel.isCanEditCommand ? 0 : 30, height: 30)
                                    .tint(Color.whiteColor)
                            }
                            .navigationDestination(isPresented: self.$isOpenEditPunishmentView) {
                                PunishmentListContentView(viewModel: PunishmentListViewModel(), isOpenEditPunishmentView: self.$isOpenEditPunishmentView)
                            }
                            .onAppear {
                                self.appEnvironment.isShowMenuList = true
                                self.isOpenEditPunishmentView = false
                            }
                        }
                    }
                    .tint(Color.blackColor)
                    .padding(.horizontal)

                    Spacer()

                    HStack {
                        ZStack {
                            // MARK: Slide Card View
                            CardContentView(viewModel: CardViewModel(side: .back))
                                .offset(y: self.isOpenCard ? UIScreen.main.bounds.height : 0)
                                .animation(.easeInOut(duration: self.viewModel.getAnimationTime()), value: self.isOpenCard)

                            // MARK: Card View Button
                            Button {
                                self.touchCardView()
                            } label: {
                                CardContentView(viewModel: CardViewModel(side: .back))
                            }
                            .disabled(self.isOpenCard)
                        }
                    }
                    .fullScreenCover(isPresented: self.$isShowPunishment, onDismiss: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.viewModel.getAnimationTime()) {
                            self.isOpenCard.toggle()
                            self.viewModel.checkIsGameEnd()
                        }
                    }, content: {
                        PunishmentContentView(viewModel: PunishmentContentViewModel(card: self.viewModel.card),
                                           isDismiss: self.$isShowPunishment)
                    })
                    .alert(Constants.Text.gameEnd, isPresented: self.$viewModel.isGameEnd) {
                        Button(Constants.Button.restart) {
                            self.viewModel.fillCard()
                        }

                        Button(Constants.Button.cancel, role: .cancel) {
                            self.viewModel.touchCancelAlertButton()
                        }
                    } message: {
                        Text(Constants.Text.restartGameAlert)
                    }

                    Spacer()

                    // MARK: Google Ads
                    VStack {
                        ZStack {
                            AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))
                                .frame(width: UIScreen.main.bounds.width, height: GADAdSizeBanner.size.height)

                            GoogleAdsManager()
                                .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                        }
                    }
                }
                .padding(.top, 20)
            }
            .toolbarVisibility(.hidden, for: .navigationBar)
        }
    }

    private func touchCardView() {
        self.isOpenCard.toggle()
        self.viewModel.randomCard()

        // Delay equal to animation duration
        DispatchQueue.main.asyncAfter(deadline: .now() + self.viewModel.getAnimationTime()) {
            self.isShowPunishment.toggle()
        }
    }
}

#Preview {
    DoraemonGameContentView()
}
