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
        TabView(selection: $tabBarSelection) {

            // MARK: Game Content View
            GameViewContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Game")
                    }
                    .padding(.top, 10)
                }
                .tag(0)

            // MARK: Setting Content View
            SettingContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "gearshape.fill")
                        Text("Setting")
                    }
                    .padding(.top, 10)
                }
                .tag(1)
        }
        .tint(Color.blackColor)
    }
}

#Preview {
    TabBarContentView()
}
