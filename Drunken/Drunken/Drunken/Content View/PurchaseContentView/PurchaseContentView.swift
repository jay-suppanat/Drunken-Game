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
        Text("Purchase Content View")
    }
}

#Preview {
    PurchaseContentView(viewModel: PurchaseViewModel(), isOpenPurchaseView: true)
}
