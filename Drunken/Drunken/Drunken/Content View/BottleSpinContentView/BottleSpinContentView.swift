//
//  BottleSpinContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 29/1/2568 BE.
//

import SwiftUI
import GoogleMobileAds

struct BottleSpinContentView: View {
    @StateObject public var viewModel: BottleSpinViewModel

    var body: some View {
        ZStack {
            AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))

            VStack {
                Spacer()

                Button {
                    self.viewModel.spinBottle()
                } label: {
                    ZStack {
                        Color.yellowColor
                            .clipShape(Circle())
                            .frame(width: 350, height: 350)

                        // MARK: Bottle Image
                        Image(systemName: "waterbottle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 300)
                            .rotationEffect(.degrees(self.viewModel.getRotateAngle()))
                            .animation(self.viewModel.getIsSpiningStatus() ? .easeOut(duration: 4) : .none, value: self.viewModel.getRotateAngle())
                            .padding()
                    }
                }
                .buttonStyle(.plain)
                .disabled(self.viewModel.getIsSpiningStatus())

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

#Preview {
    BottleSpinContentView(viewModel: BottleSpinViewModel())
}
