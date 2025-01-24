//
//  TabBarContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

enum GameSelected {
    case doraemonCardGame
    case rotateBottle
}

// MARK: TabBarContentView

struct TabBarContentView: View {
    @State private var gameSelected: GameSelected = .doraemonCardGame

    // Action
    @State private var isOpenGameList: Bool = false

    var body: some View {
        ZStack {
            DoraemonGameContentView()

            VStack {
                HStack {
                    Button {
                        self.isOpenGameList.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .tint(Color.yellowColor)

                            VStack {
                                Text("Game List")
                                    .font(Font.lazyDog14)
                                    .foregroundStyle(Color.whiteColor)
                            }
                        }
                    }

                    Spacer()
                }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 20)
        }
    }
}

// MARK: GameListCell

struct GameListCell: View {
    var body: some View {
        Text("Game List Cell")
    }
}

#Preview {
    TabBarContentView()
}
