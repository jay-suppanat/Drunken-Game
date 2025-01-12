//
//  SettingMenuListModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import Foundation

// MARK: - SettingMenuList
struct SettingMenuListModel: Identifiable, Codable {
    var id = UUID()
    let list: [List]
}

// MARK: - List
struct List: Identifiable, Codable {
    var id = UUID()
    let title, image: String
}
