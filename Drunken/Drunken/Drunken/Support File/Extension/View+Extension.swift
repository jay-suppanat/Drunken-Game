//
//  View+Extension.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 23/1/2568 BE.
//

import SwiftUI
import SwiftUICore

public extension View {
    func setupNavigationBar(title: String) -> some View {
        self.modifier(NavigationBarModifier(title: title))
    }

    func setupListView() -> some View {
        self.modifier(ListViewModifier())
    }

    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
                        .font(Font.lazyDog16)
                }
            })
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
