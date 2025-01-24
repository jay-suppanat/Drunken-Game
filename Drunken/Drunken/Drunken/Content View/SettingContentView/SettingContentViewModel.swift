//
//  SettingContentViewModel.swift
//  Drunken
//
//  Created by Suppanat Chinthumrucks on 12/1/2568 BE.
//

import Combine
import SwiftUI

class SettingContentViewModel: ObservableObject {
    @Published private var settingMenuPublished: SettingMenuListModel = .init()

    init() {
        self.fetchSettingMenu()
    }
}

// MARK: Service

extension SettingContentViewModel: Service {
    public func fetchSettingMenu() {
        DrunkenService.fetchSettingMenuList { response in
            self.settingMenuPublished = response
        }
    }

    public func getSettingMenuListCount() -> Int {
        return self.settingMenuPublished.list.count
    }

    public func getSettingManuListAtIndex(_ index: Int) -> SettingMenuElement {
        return self.settingMenuPublished.list[index]
    }
}
