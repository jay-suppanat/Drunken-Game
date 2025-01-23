//
//  DrunkenApp.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

@main
struct DrunkenApp: App {
    init() {
        self.initTabBarAppearance()
    }

    var body: some Scene {
        WindowGroup {
            TabBarContentView()
        }
    }

    private func initTabBarAppearance() {
        let itemAppearance = UITabBar.appearance()
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(named: "black_color")
        itemAppearance.standardAppearance = appearance
        itemAppearance.scrollEdgeAppearance = appearance
        itemAppearance.unselectedItemTintColor = UIColor.unselectedTabBarColor
    }
}
