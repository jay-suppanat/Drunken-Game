//
//  PurchaseContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 24/1/2568 BE.
//

import SwiftUI

struct PurchaseContentView: View {
    @StateObject public var viewModel: PurchaseViewModel

    // Action
    @Binding public var isOpenPurchaseView: Bool

    var body: some View {
        ZStack {
            AnimationBackgroundContentView(viewModel: AnimationBackgroundViewModel(gredient: [Color.blackColor]))

            VStack {
                // MARK: Remove Ads Button
                Button {
                    // Call Store Kit API
                } label: {
                    Text("Purchase Content View")
                }
            }
            .setupNavigationBar(title: "Remove Ads")
        }
    }
}

#Preview {
//    PurchaseContentView(viewModel: PurchaseViewModel(), isOpenPurchaseView: $true)
}
