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
        let appearance = UITabBar.appearance()
        appearance.backgroundColor = UIColor.tabBarBackgroundColor
        appearance.unselectedItemTintColor = UIColor.lightGray
    }
}
