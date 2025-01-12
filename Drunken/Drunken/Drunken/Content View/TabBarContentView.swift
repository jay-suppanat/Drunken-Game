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
            DoraemonGameContentView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Game")
                }
                .tag(1)

            SettingContentView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Setting")
                }
                .tag(2)
        }
    }
}

#Preview {
    TabBarContentView()
}
