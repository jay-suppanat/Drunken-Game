//
//  SettingListCellViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import Foundation

class SettingListCellViewModel: ObservableObject {
    @Published private var dataPublished: SettingMenuElement
    @Published private var isSetDefaultLang: Bool = false

    init(data: SettingMenuElement) {
        self.dataPublished = data
        self.isSetDefaultLang = UserDefaultManager.shared.getDefaultLanguage() == "en" ? true : false
    }
}

// MARK: Get

extension SettingListCellViewModel: Get {
    public func getSettingMenuData() -> SettingMenuElement {
        return self.dataPublished
    }
}
