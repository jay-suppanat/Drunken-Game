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
        self.initNavigationAppearance()
    }

    var body: some Scene {
        WindowGroup {
            TabBarContentView()
        }
    }

    private func initTabBarAppearance() {
        let appearance = UITabBar.appearance()
        appearance.backgroundColor = UIColor.clear
        appearance.unselectedItemTintColor = UIColor.unselectedTabBarColor
        appearance.tintColor = UIColor.selectedTabBarColor
    }

    private func initNavigationAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
