//
//  DiceRollContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import SwiftUI
import GoogleMobileAds

struct DiceRollContentView: View {
    @StateObject public var viewModel: DiceRollViewModel

    var body: some View {
        ZStack {
            AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))

            VStack {
                Spacer()

                VStack {
                    Text(self.viewModel.isRollDice() ? self.viewModel.getDiceFace().punishment : Constants.Text.pressToRoll)
                        .font(.notoSan18)

                    Button {
                        self.viewModel.randomDice()
                        self.viewModel.toggleIsRollDice()
                    } label: {
                        HStack(spacing: 20) {
                            DiceView(diceFace: self.viewModel.getDiceFace().diceOne)

                            DiceView(diceFace: self.viewModel.getDiceFace().diceTwo)
                        }
                        .padding(.horizontal, 10)
                    }
                }

                Spacer()

                ZStack {
                    AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))
                        .frame(width: UIScreen.main.bounds.width, height: GADAdSizeBanner.size.height)

                    GoogleAdsManager()
                        .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                }
            }
        }
    }
}

// MARK: DiceView

struct DiceView: View {
    var diceFace: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.whiteColor)
                .frame(width: 100, height: 100)

            HStack {
                switch self.diceFace {
                case 1:
                    DiceDotView(isShowTwoDot: false)
                case 2:
                    DiceDotView(isShowTwoDot: true)
                case 3:
                    VStack(spacing: 10) {
                        ForEach(0..<self.diceFace, id: \.self) { _ in
                            DiceDotView(isShowTwoDot: false)
                        }
                    }
                case 4:
                    VStack(spacing: 20) {
                        DiceDotView(isShowTwoDot: true)

                        DiceDotView(isShowTwoDot: true)
                    }
                case 5:
                    VStack(spacing: 10) {
                        DiceDotView(isShowTwoDot: true)

                        DiceDotView(isShowTwoDot: false)

                        DiceDotView(isShowTwoDot: true)
                    }
                case 6:
                    VStack(spacing: 10) {
                        DiceDotView(isShowTwoDot: true)

                        DiceDotView(isShowTwoDot: true)

                        DiceDotView(isShowTwoDot: true)
                    }
                default:
                    Text(Constants.Alert.errorAlert)
                        .font(.lazyDog30)
                        .foregroundStyle(Color.redColor)
                }
            }
        }
    }
}

// MARK: DiceDotView

struct DiceDotView: View {
    @State var isShowTwoDot: Bool

    var body: some View {
        HStack(spacing: 20) {
            if self.isShowTwoDot {
                Circle()
                    .fill(Color.blackColor)
                    .frame(width: 10, height: 10)
            }

            Circle()
                .fill(Color.blackColor)
                .frame(width: 10, height: 10)
        }
    }
}

#Preview {
    DiceRollContentView(viewModel: DiceRollViewModel())
}
