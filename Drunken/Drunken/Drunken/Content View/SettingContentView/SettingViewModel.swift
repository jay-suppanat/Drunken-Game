//
//  SettingViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 31/1/2568 BE.
//

import Foundation

class SettingViewModel: ObservableObject {
    @Published private var settingMenuListPublished: SettingMenuListModel = SettingMenuListModel()

    init() {
        self.fetchSettingMenuList()
    }
}

// MARK: Service

extension SettingViewModel: Service {
    private func fetchSettingMenuList() {
        DrunkenService.fetchSettingMenuList { response in
            self.settingMenuListPublished = response
        }
    }
}

// MARK: Get

extension SettingViewModel: Get {
    public func getSettingMenuListCount() -> Int {
        return self.settingMenuListPublished.list.count
    }

    public func getSettingMenuAtIndex(_ index: Int) -> SettingMenuElement {
        return self.settingMenuListPublished.list[index]
    }
}
