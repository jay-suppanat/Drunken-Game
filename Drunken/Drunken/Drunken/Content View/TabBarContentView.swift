//
//  TabBarContentView.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import SwiftUI

// MARK: TabBarContentView

struct TabBarContentView: View {
    // Environment
    @EnvironmentObject private var appEnvironment: EnvironmentManager

    // Action
    @State private var isOpenMenuList: Bool = false

    var body: some View {
        ZStack {
            switch self.appEnvironment.menuSelectedIndex {
            case 1:
                DoraemonGameContentView()
            case 2:
                Text("asd")
            default:
                Text("Sorry, This menu is not available now.")
                    .multilineTextAlignment(.center)
                    .font(Font.lazyDog25)
                    .foregroundStyle(Color.redColor)
            }

            if self.isOpenMenuList {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
            }

            if self.appEnvironment.isShowMenuList {
                VStack(spacing: 15) {
                    HStack {
                        Button {
                            withAnimation {
                                self.isOpenMenuList.toggle()
                            }
                        } label: {
                            HStack {
                                Image(systemName: "list.bullet.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .tint(Color.yellowColor)

                                if self.isOpenMenuList {
                                    Text("Menu")
                                        .font(Font.lazyDog16)
                                        .foregroundStyle(Color.whiteColor)
                                }
                            }
                        }

                        Spacer()
                    }

                    if self.isOpenMenuList {
                        ScrollView {
                            ForEach(0 ..< UserDefaultManager.shared.getGameList().list.count, id: \.self) { index in
                                GameListCell(data: UserDefaultManager.shared.getGameList().list[index],
                                             isOpenMenuList: self.$isOpenMenuList)
                            }
                        }
                        .transition(.move(edge: .leading))
                        .animation(.smooth, value: self.isOpenMenuList)
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
    @Binding var isOpenMenuList: Bool

    // Environment
    @EnvironmentObject private var appEnvironment: EnvironmentManager

    var body: some View {
        ZStack {
            HStack {
                Button {
                    withAnimation {
                        self.isOpenMenuList.toggle()
                    }
                    self.appEnvironment.menuSelectedIndex = self.data.id
                } label: {
                    switch self.data.game {
                    case "setting", "info":
                        Text("\(self.data.id). \(self.data.gameName)")
                            .font(Font.lazyDog16)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                            .foregroundStyle(Color.blackColor)
                    default:
                        Text("\(self.data.id). \(self.data.gameName)")
                            .font(Font.lazyDog16)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                    }
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
