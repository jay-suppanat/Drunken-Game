//
//  View+Extension.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 23/1/2568 BE.
//

import SwiftUICore
import SwiftUI

extension View {
    public func setupNavigationBar(title: String) -> some View {
        self.modifier(NavigationBarModifier(title: title))
    }

    public func setupListView() -> some View {
        self.modifier(ListViewModifier())
    }
}

// MARK: NavigationBarModifier

struct NavigationBarModifier: ViewModifier {
    public var title: String

    func body(content: Content) -> some View {
        content
            .toolbarBackground(Color.blackColor, for: .navigationBar)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text(self.title)
                        .foregroundStyle(Color.whiteColor)
                }
            })
            .navigationBarTitleDisplayMode(.large)
            .toolbarRole(.editor)
    }
}

// MARK: ListViewModifier

struct ListViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollContentBackground(.hidden)
    }
}
