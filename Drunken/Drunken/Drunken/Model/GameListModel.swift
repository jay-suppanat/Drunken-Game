//
//  GameListModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 25/1/2568 BE.
//

import Foundation

// MARK: - SettingMenuList
struct GameListModel: Identifiable, Codable {
    var id = UUID()
    let list: [GameListElement]

    init() {
        self.list = .init()
    }
}

// MARK: - List
struct GameListElement: Identifiable, Codable {
    var id = UUID()
    let game, gameName: String

    init() {
        self.game = ""
        self.gameName = ""
    }
}
