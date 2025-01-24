//
//  GameListModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 25/1/2568 BE.
//

import Foundation

// MARK: - SettingMenuList
struct GameListModel: Identifiable, Codable {
    let id: Int
    let list: [GameListElement]

    init() {
        self.id = 0
        self.list = .init()
    }
}

// MARK: - List
struct GameListElement: Identifiable, Codable {
    let id: Int
    let game, gameName: String

    init() {
        self.id = 0
        self.game = ""
        self.gameName = ""
    }
}
