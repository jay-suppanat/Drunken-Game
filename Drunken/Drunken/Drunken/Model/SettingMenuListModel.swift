//
//  SettingMenuListModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import Foundation

// MARK: - SettingMenuList
struct SettingMenuListModel: Identifiable, Codable {
    let id: Int
    let list: [SettingMenuElement]

    init() {
        self.id = 0
        self.list = .init()
    }
}

// MARK: - List
struct SettingMenuElement: Identifiable, Codable {
    let id: Int
    let menu, menuName: String

    init() {
        self.id = 0
        self.menu = ""
        self.menuName = ""
    }
}
