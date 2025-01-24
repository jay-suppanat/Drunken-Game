//
//  TabBarContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

enum GameSelective {
    case doraemonCardGame
    case rotateBottle
}

struct TabBarContentView: View {
    var body: some View {
        ZStack {
            DoraemonGameContentView()
        }






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
