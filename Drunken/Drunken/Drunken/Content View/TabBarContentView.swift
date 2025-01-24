//
//  TabBarContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

// MARK: TabBarContentView

struct TabBarContentView: View {
    @State private var isShowSideMenu: Bool = true

    // Environment
    @EnvironmentObject private var appEnvironment: EnvironmentManager

    // Action
    @State private var isOpenGameList: Bool = false

    var body: some View {
        ZStack {
            switch self.appEnvironment.gameSelectedIndex {
            case 0:
                DoraemonGameContentView()
            case 1:
                Text("asd")
            default:
                Text("Sorry, this game will launch soon.")
                    .font(Font.lazyDog25)
                    .foregroundStyle(Color.redColor)
            }

            if self.appEnvironment.isShowGameListMenu {
                EmptyView()
                    .ignoresSafeArea()

                VStack(spacing: 15) {
                    HStack {
                        Button {
                            self.isOpenGameList.toggle()
                        } label: {
                            HStack {
                                Image(systemName: "list.bullet.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .tint(Color.yellowColor)

                                VStack {
                                    Text("Game List")
                                        .font(Font.lazyDog16)
                                        .foregroundStyle(Color.whiteColor)
                                }
                            }
                        }

                        Spacer()
                    }

                    if self.isOpenGameList {
                        ScrollView {
                            ForEach(0 ..< UserDefaultManager.shared.getGameList().list.count, id: \.self) { index in
                                GameListCell(data: UserDefaultManager.shared.getGameList().list[index],
                                             index: index)
                            }
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
        }
    }
}

// MARK: GameListCell

struct GameListCell: View {
    var data: GameListElement
    var index: Int

    // Environment
    @EnvironmentObject private var appEnvironment: EnvironmentManager

    var body: some View {
        ZStack {
            HStack {
                Button {
                    self.appEnvironment.gameSelectedIndex = self.index
                } label: {
                    Text("\(self.index + 1). \(self.data.gameName)")
                        .font(Font.lazyDog16)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                }
                .background(Color.whiteColor)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                Spacer()
            }
        }
    }
}

#Preview {
    TabBarContentView()
}
