//
//  SettingMenuListModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import Foundation

// MARK: - SettingMenuList
struct SettingMenuListModel: Identifiable, Codable {
    init(id: UUID = UUID()) {
        self.id = id
        self.list = .init()
    }

    var id = UUID()
    let list: [List]
}

// MARK: - List
struct List: Identifiable, Codable {
    init(id: UUID = UUID()) {
        self.id = id
        self.title = ""
        self.image = ""
    }

    var id = UUID()
    let title, image: String
}
