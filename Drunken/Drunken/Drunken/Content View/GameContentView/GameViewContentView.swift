//
//  GameViewContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 19/1/2568 BE.
//

import SwiftUI
import GoogleMobileAds

struct GameViewContentView: View {
    @StateObject private var viewModel: GameViewModel = .init()

    // Action State
    @State private var isShowPunishment: Bool = false
    @State private var isOpenCard: Bool = false
    @State private var isOpenEditPunishmentView: Bool = false
    @State private var isOpenSideMenu: Bool = false
    @State private var isOpenPurchaseView: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: Background Color
                AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.backgroundColor]))

                VStack(spacing: 175) {
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
                        .alert(Constants.Text.gameEnd, isPresented: self.$viewModel.isShowAlert) {
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
                                self.isOpenEditPunishmentView = true
                            } label: {
                                Image(systemName: "pencil.circle.fill")
                                    .resizable()
                                    .frame(width: !self.viewModel.isCanEditCommand ? 0 : 30, height: 30)
                                    .tint(Color.whiteColor)
                            }
                            .navigationDestination(isPresented: self.$isOpenEditPunishmentView) {
                                PunishmentListContentView(viewModel: PunishmentListViewModel())
                            }
                            .onAppear {
                                self.isOpenEditPunishmentView = false
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
                                .offset(y: self.isOpenCard ? UIScreen.main.bounds.height : 0)
                                .animation(.easeInOut(duration: self.viewModel.getAnimationTime()), value: self.isOpenCard)

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
                            .disabled(self.isOpenCard)
                        }
                    }
                    .fullScreenCover(isPresented: self.$isShowPunishment, onDismiss: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.viewModel.getAnimationTime()) {
                            self.isOpenCard.toggle()
                        }
                    }, content: {
                        PunishmentContentView(viewModel: PunishmentContentViewModel(card: self.viewModel.card),
                                           isDismiss: self.$isShowPunishment)
                    })
                    .alert(Constants.Text.restartGameAlert, isPresented: self.$viewModel.isGameEnd) {
                        Button(Constants.Button.restart) {
                            self.viewModel.fillCard()
                        }

                        Button(Constants.Button.cancel, role: .cancel) {
                            self.viewModel.touchCancelAlertButton()
                        }
                    }

                    Spacer()
                }
                .padding(.top, 20)

                // MARK: Side Menu Button
                VStack(spacing: 20) {
                    Spacer()

                    HStack {
                        Spacer()

                        if self.isOpenSideMenu {
                            HStack {
                                // MARK: Info Button
                                Button {
                                    // Setting
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .tint(Color.whiteColor)
                                }

                                // MARK: Remove Ads Button
                                Button {
                                    // Remove Ads
                                } label: {
                                    Image(systemName: "cart.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .tint(Color.whiteColor)
                                }
                                .navigationDestination(isPresented: self.$isOpenPurchaseView) {
                                    PurchaseContentView(viewModel: PurchaseViewModel(), isOpenPurchaseView: self.$isOpenPurchaseView)
                                }
                            }
                        }

                        // MARK: Side Menu Button
                        Button {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                self.isOpenSideMenu.toggle()
                            }
                        } label: {
                            Image(systemName: self.isOpenSideMenu ? "chevron.left.circle.fill" : "list.bullet.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .tint(self.isOpenSideMenu ? Color.yellowColor : Color.whiteColor)
                        }
                        .frame(alignment: .leading)
                    }
                    .padding(.horizontal)

                    ZStack {
                        AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))
                            .frame(width: UIScreen.main.bounds.width, height: GADAdSizeBanner.size.height)

                        GoogleAdsManager()
                            .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                    }
                }
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
    GameViewContentView()
        .background(Color.orange)
}
