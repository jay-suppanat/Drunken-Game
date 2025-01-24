//
//  GoogleAdsManager.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 24/1/2568 BE.
//

import GoogleMobileAds
import SwiftUI

struct GoogleAdsManager: UIViewControllerRepresentable {
    let bannerView = GADBannerView(adSize: GADAdSizeBanner)

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        self.bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        self.bannerView.rootViewController = viewController
        viewController.view.addSubview(self.bannerView)
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        self.bannerView.load(GADRequest())
    }
}
