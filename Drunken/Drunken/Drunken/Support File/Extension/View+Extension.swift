//
//  View+Extension.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 23/1/2568 BE.
//

import SwiftUICore

extension View {
    func setupNavigationBar(title: String) -> some View {
        self.modifier(NavigationBarModifier(title: title))
    }
}

// MARK: NavigationBarModifier

struct NavigationBarModifier: ViewModifier {
    public var title: String

    func body(content: Content) -> some View {
        content
            .toolbarBackground(Color.navigationBackgroundColor, for: .navigationBar)
            .toolbarColorScheme(.light, for: .navigationBar)
            .navigationTitle(self.title)
            .navigationBarTitleDisplayMode(.large)
            .toolbarRole(.editor)
            .toolbarBackground(Color.navigationBackgroundColor, for: .navigationBar)
    }
}
