//
//  TabBarContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

struct TabBarContentView: View {
    @State private var tabBarSelection: Int = 0
    @State private var isActive: Bool = false

    var body: some View {
        GameViewContentView()
//        TabView(selection: $tabBarSelection) {
//
//            // MARK: Game Content View
//            GameViewContentView()
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Game")
//
//                }
//                .tag(0)
//
//            // MARK: Setting Content View
//            SettingContentView(viewModel: SettingContentViewModel())
//                .tabItem {
//                    Image(systemName: "gearshape.fill")
//                    Text("Setting")
//                }
//                .tag(1)
//        }
//        .tint(Color.yellowColor)
    }
}

#Preview {
    TabBarContentView()
}
