//
//  TabBarContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

struct TabBarContentView: View {
    @State private var tabBarSelection: Int = 0

    var body: some View {
        TabView(selection: $tabBarSelection) {
            GameViewContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .symbolEffect(.bounce, isActive: self.tabBarSelection == 0)
                    Text("Game")
                }
                .tag(0)

            SettingContentView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                        .symbolEffect(.bounce, isActive: self.tabBarSelection == 1)
                    Text("Setting")
                }
                .tag(1)
        }
        .tint(ThemeManager.Colors.black)
        .foregroundStyle(ThemeManager.Colors.black)
    }
}

#Preview {
    TabBarContentView()
}
